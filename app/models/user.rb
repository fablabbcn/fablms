class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :create_org_on_signup

  has_many :user_organizations, dependent: :destroy
  has_many :organizations, through: :user_organizations
  belongs_to :organization

  def create_org_on_signup
    # if not invited
    # New users must belong to an organization, let's create it automatically
    if new_record?
      org = Organization.create! name: "#{email.split("@")[0]} Organization"
      self.organization_id = org.id
      # add to array of orgs
      self.organizations << org
    end
  end

  def selected_organization
    # if the variable is empty, use the first org as fallback
    organization || organizations.first
  end

end

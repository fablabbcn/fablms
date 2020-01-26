class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :create_org_on_signup
  has_many :user_organizations
  has_many :organizations, through: :user_organizations

  def create_org_on_signup
    #if not invited
    org = Organization.create! name: "#{email.split("@")[0]} Organization"
    # add to array of orgs
    self.organizations << org
  end

  def selected_organization
    # TODO: add migration variable to switch between orgs
    # if the variable is empty, use the first org as fallback
    organizations.first
  end

end

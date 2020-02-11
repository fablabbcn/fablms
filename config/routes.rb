Rails.application.routes.draw do
  devise_for :users
  resources :organizations do
    member do
      get 'gitlab_check'
    end
    collection do
      post :group_members
      post :group_subgroups
      post :group_projects
      post :issue_list
    end
  end
  resources :students do
    collection do
      post :edit_multiple
      post :import
    end
  end

  resources :labs
  resources :courses
  resources :years
  root to: 'years#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

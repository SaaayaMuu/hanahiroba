Rails.application.routes.draw do


  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  root to: 'public/homes#top'

  namespace :public do
  end
# 顧客用
# URL /customers/sign_in ...
devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :designs, only: [:new, :create, :show, :edit, :update, :index, :destroy]
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
  end

end


#new_admin_session GET    /admin/sign_in(.:format)                        admin/sessions#new
#admin_session POST   /admin/sign_in(.:format)                            admin/sessions#create
#destroy_admin_session DELETE /admin/sign_out(.:format)                   admin/sessions#destroy

#admin_designs GET    /admin/designs(.:format)                             admin/designs#index
#              POST   /admin/designs(.:format)                             admin/designs#create
#new_admin_design GET    /admin/designs/new(.:format)                      admin/designs#new
#edit_admin_design GET    /admin/designs/:id/edit(.:format)                admin/designs#edit
#admin_design GET    /admin/designs/:id(.:format)                          admin/designs#show
#             PATCH  /admin/designs/:id(.:format)                          admin/designs#update
#             DELETE /admin/designs/:id(.:format)                          admin/designs#destroy

#admin_genres GET    /admin/genres(.:format)                                admin/genres#index
#             POST   /admin/genres(.:format)                                admin/genres#create
#edit_admin_genre GET    /admin/genres/:id/edit(.:format)                   admin/genres#edit
#admin_genre PATCH  /admin/genres/:id(.:format)                             admin/genres#update
#            DELETE /admin/genres/:id(.:format)                             admin/genres#destroy

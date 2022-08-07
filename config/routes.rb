Rails.application.routes.draw do



  root to: 'public/homes#top'

  namespace :public do
  end
# 顧客用
# URL /customers/sign_in ...
devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions',
  passwords: 'public/passwords'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :designs, only: [:new, :create, :show, :edit, :update, :index, :destroy]
    resources :items, only: [:create]
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
  end

  scope module: :public do
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    resources :customers, only: [:show, :edit, :unsubscribe]

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

#admin_items POST   /admin/items(.:format)                                 admin/items#create

#admin_genres GET    /admin/genres(.:format)                                admin/genres#index
#             POST   /admin/genres(.:format)                                admin/genres#create
#edit_admin_genre GET    /admin/genres/:id/edit(.:format)                   admin/genres#edit
#admin_genre PATCH  /admin/genres/:id(.:format)                             admin/genres#update
#            DELETE /admin/genres/:id(.:format)                             admin/genres#destroy


#new_customer_password GET    /customers/password/new(.:format)             devise/passwords#new
#edit_customer_password GET    /customers/password/edit(.:format)           devise/passwords#edit

#new_customer_registration GET    /customers/sign_up(.:format)              public/registrations#new
#edit_customer_registration GET    /customers/edit(.:format)                public/registrations#edit

#customers_unsubscribe GET    /customers/unsubscribe(.:format)              public/customers#unsubscribe
#edit_customer GET    /customers/:id/edit(.:format)                         public/customers#edit
#customer GET    /customers/:id(.:format)                                   public/customers#show

#new_customer_password GET    /customers/password/new(.:format)             devise/passwords#new
#edit_customer_password GET    /customers/password/edit(.:format)           devise/passwords#edit
#customer_password PATCH  /customers/password(.:format)                     devise/passwords#update
#PUT    /customers/password(.:format)                                       devise/passwords#update
#POST   /customers/password(.:format)                                       devise/passwords#create
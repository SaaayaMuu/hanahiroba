Rails.application.routes.draw do


# 顧客用
# URL /customers/sign_in ...

devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions',
  passwords: 'public/passwords'
}

# # 管理者用
# # URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :designs, only: [:new, :create, :show, :edit, :update, :index, :destroy]
    resources :items, only: [:create, :destroy]
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :reviews, only: [:index, :destroy]
    get '/' => 'homes#top'
  end

  root to: "public/homes#top"
  scope module: :public do
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'
    resources :customers, only: [:show, :edit, :update]
    resources :items, only: [:update]
    resources :designs, only: [:index, :show]
    resources :genres, only: [:index]
    resources :cart_items, only: [:index, :create, :update, :destroy, :destroy_all]
    post '/cart_items/order_made_create' => 'cart_items#order_made_create'
    delete :cart_items, to: 'cart_items#destroy_all'
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/thanks'=> 'orders#thanks'
    resources :orders, only: [:new, :index, :show, :create]
    resources :address, only: [:create]
    resources :reviews, only: [:index, :new, :create]
  end
end


#new_admin_session GET    /admin/sign_in(.:format)                        admin/sessions#new
#admin_session POST   /admin/sign_in(.:format)                            admin/sessions#create
#destroy_admin_session DELETE /admin/sign_out(.:format)                   admin/sessions#destroy

#admin GET    /admin(.:format)                                              admin/homes#top

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

#admin_customers GET    /admin/customers(.:format)                          admin/customers#index
#edit_admin_customer GET    /admin/customers/:id/edit(.:format)             admin/customers#edit
#admin_customer GET    /admin/customers/:id(.:format)                       admin/customers#show
#               PATCH  /admin/customers/:id(.:format)                       admin/customers#update

#admin_order GET    /admin/orders/:id(.:format)                             admin/orders#show
#PATCH  /admin/orders/:id(.:format)                                         admin/orders#update

#admin_reviews GET    /admin/reviews(.:format)                              admin/reviews#index
#admin_review DELETE /admin/reviews/:id(.:format)                           admin/reviews#destroy


#new_customer_password GET    /customers/password/new(.:format)             devise/passwords#new
#edit_customer_password GET    /customers/password/edit(.:format)           devise/passwords#edit

#new_customer_registration GET    /customers/sign_up(.:format)              public/registrations#new
#edit_customer_registration GET    /customers/edit(.:format)                public/registrations#edit

#customers_unsubscribe GET    /customers/unsubscribe(.:format)              public/customers#unsubscribe
#customers_withdraw PATCH  /customers/withdraw(.:format)                    public/customers#withdraw

#new_customer_session GET    /customers/sign_in(.:format)                   public/sessions#new
#customer_session POST   /customers/sign_in(.:format)                       public/sessions#create
#destroy_customer_session DELETE /customers/sign_out(.:format)              public/sessions#destroy

#genres GET    /genres(.:format)                                            public/genres#index

#item PATCH  /items/:id(.:format)                                           public/items#update

#designs GET    /designs(.:format)                                          public/designs#index
#design GET    /designs/:id(.:format)                                       public/designs#show

#customers_unsubscribe GET    /customers/unsubscribe(.:format)              public/customers#unsubscribe
#edit_customer GET    /customers/:id/edit(.:format)                         public/customers#edit
#customer GET    /customers/:id(.:format)                                   public/customers#show
#         PATCH  /customers/:id(.:format)                                   public/customers#update

#cart_items GET    /cart_items(.:format)                                    public/cart_items#index
#           POST   /cart_items(.:format)                                    public/cart_items#create
#cart_items_order_made_create POST   /cart_items/order_made_create(.:format)    public/cart_items#order_made_create

#cart_item PATCH  /cart_items/:id(.:format)                                 public/cart_items#update
#          DELETE /cart_items/:id(.:format)                                 public/cart_items#destroy
#          DELETE /cart_items(.:format)                                     public/cart_items#destroy_all

#orders GET    /orders(.:format)                                            public/orders#index
#POST   /orders(.:format)                                                   public/orders#create
#new_order GET    /orders/new(.:format)                                     public/orders#new
#order GET    /orders/:id(.:format)                                         public/orders#show
#orders_confirm POST   /orders/confirm(.:format)                            public/orders#confirm
#orders_thanks GET    /orders/thanks(.:format)                              public/orders#thanks

#address_index POST   /address(.:format)                                    public/address#create

#reviews GET    /reviews(.:format)                                          public/reviews#index
#        POST   /reviews(.:format)                                          public/reviews#create
#new_review GET    /reviews/new(.:format)                                   public/reviews#new

#new_customer_password GET    /customers/password/new(.:format)             devise/passwords#new
#edit_customer_password GET    /customers/password/edit(.:format)           devise/passwords#edit
#customer_password PATCH  /customers/password(.:format)                     devise/passwords#update
#PUT    /customers/password(.:format)                                       devise/passwords#update
#POST   /customers/password(.:format)                                       devise/passwords#create
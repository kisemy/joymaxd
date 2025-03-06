Rails.application.routes.draw do
    

  #resources :sales_orders
  #resources :sales_quotes
  resources :salespeople
  resources :roles  
  resources :permissions
    
  resources :bankgroups
  resources :chart_of_accounts
  devise_for :users
  #devise_for :users
  resources :account_types
  resources :categories
  resources :vendors
  
  resources :gledgers
  resources :products
  resources :charge_types
  resources :chargetypes
  resources  :invoices
  resources :invoice_lines
  
  resources  :salespersons
  # devise_for :users
  #devise_for :users
  #resources :invoices
   #resources :payments

 #get '/payments/fetch_accountno', to: 'payments#fetch_accountno'
 #get '/receipts/fetch_accountno', to: 'receipts#fetch_accountno'

 #devise_for :users,
 # :skip => [:registrations, :sessions]

# as user do
  # Registrations
 # get   '/signup'   => 'users/registrations#new', as: :new_user_registration
#  post  '/signup'   => 'users/registrations#create', as: :user_registration
# end

#devise_for :users
#devise_scope :user do
 # authenticated :user do
  #  root 'dashboards#dashboard_1', as: :authenticated_root
 #end

  #root 'devise/sessions#new'

#end


#devise_for :users
#devise_scope :user do
 # authenticated :user do
    #root 'dashboards#dashboard_1', as: :authenticated_root
 # end

  #root 'devise/sessions#new'

#end


# authenticated :user do

 # root to: 'dashboards#dashboard_1'

# end

      # root :to => "devise/sessions#new"

#root 'dashboards#dashboard_1'
#root to: 'dashboards#dashboard_1'
   
  #resources :receipt_lines
  #resources :receipts
  #resources :receipts, only: [:new, :create, :edit, :update]
  
  
  resources :paymentlines
  #resources :payments
  #resources :items
  resources :cashes
 resources :banks
  resources :accharts
  
  #resources :customers
# You can have the root of your site routed with "root"
  

  # All routes
  get "dashboards/dashboard_1"
  get "dashboards/dashboard_2"
  get "dashboards/dashboard_3"
  get "dashboards/dashboard_4"
  get "dashboards/dashboard_4_1"
  get "dashboards/dashboard_5"
  get "dashboards/index"

  get "layoutsoptions/index"
  get "layoutsoptions/off_canvas"

  get "graphs/flot"
  get "graphs/morris"
  get "graphs/rickshaw"
  get "graphs/chartjs"
  get "graphs/chartist"
  get "graphs/peity"
  get "graphs/sparkline"
  get "graphs/c3charts"

  get "mailbox/inbox"
  get "mailbox/email_view"
  get "mailbox/compose_email"
  get "mailbox/email_templates"
  get "mailbox/basic_action_email"
  get "mailbox/alert_email"
  get "mailbox/billing_email"

  get "metrics/index"

  get "widgets/index"

  get "forms/basic_forms"
  get "forms/advanced"
  get "forms/wizard"
  get "forms/file_upload"
  get "forms/text_editor"
  get "forms/autocomplete"
  get "forms/markdown"

  get "appviews/contacts"
  get "appviews/profile"
  get "appviews/profile_two"
  get "appviews/contacts_two"
  get "appviews/projects"
  get "appviews/project_detail"
  get "appviews/activity_stream"
  get "appviews/file_menager"
  get "appviews/vote_list"
  get "appviews/calendar"
  get "appviews/faq"
  get "appviews/timeline"
  get "appviews/pin_board"
  get "appviews/teams_board"
  get "appviews/social_feed"
  get "appviews/clients"
  get "appviews/outlook_view"
  get "appviews/blog"
  get "appviews/article"
  get "appviews/issue_tracker"
   

  get "pages/search_results"

  #get "pages/lockscreen" devise_scope :user do
    #  root :to => "devise/sessions#new"
    #end

  get "pages/invoice"
  get "pages/invoice_print"
  get "pages/login"
  get "pages/login_2"
  get "pages/forgot_password"
  get "pages/register"
  get "pages/not_found_error"
  get "pages/internal_server_error"
  get "pages/empty_page"

  get "miscellaneous/notification"
  get "miscellaneous/nestablelist"
  get "miscellaneous/timeline_second_version"
  get "miscellaneous/forum_view"
  get "miscellaneous/forum_post_view"
  get "miscellaneous/google_maps"
  get "miscellaneous/datamaps"
  get "miscellaneous/social_buttons"
  get "miscellaneous/code_editor"
  get "miscellaneous/modal_window"
  get "miscellaneous/validation"
  get "miscellaneous/tree_view"
  get "miscellaneous/chat_view"
  get "miscellaneous/agile_board"
  get "miscellaneous/diff"
  get "miscellaneous/pdf_viewer"
  get "miscellaneous/sweet_alert"
  get "miscellaneous/idle_timer"
  get "miscellaneous/spinners"
  get "miscellaneous/spinners_usage"
  get "miscellaneous/live_favicon"
  get "miscellaneous/masonry"
  get "miscellaneous/tour"
  get "miscellaneous/loading_buttons"
  get "miscellaneous/clipboard"
  get "miscellaneous/text_spinners"
  get "miscellaneous/truncate"
  get "miscellaneous/password_meter"
  get "miscellaneous/i18support"

  get "uielements/typography"
  get "uielements/icons"
  get "uielements/draggable_panels"
  get "uielements/resizeable_panels"
  get "uielements/buttons"
  get "uielements/video"
  get "uielements/tables_panels"
  get "uielements/tabs"
  get "uielements/notifications_tooltips"
  get "uielements/helper_classes"
  get "uielements/badges_labels_progress"

  get "gridoptions/index"

  get "tables/static_tables"
  get "tables/data_tables"
  get "tables/foo_tables"
  get "tables/jqgrid"

  get "commerce/products_grid"
  get "commerce/products_list"
  get "commerce/product_edit"
  get "commerce/product_detail"
  get "commerce/orders"
  get "commerce/cart"
  get "commerce/payments"

  get "gallery/basic_gallery"
  get "gallery/slick_carusela"
  get "gallery/bootstrap_carusela"

  get "cssanimations/index"

  get "landing/index"

root to: 'dashboards#dashboard_1'
# routes for adding fields dynamically
#resources :invoices do
  #get '/add_field', to: 'invoices#add_field', as: 'add_field'
 # post '/add_field', to: 'invoices#add_field'
#end






resources :invoices do
   collection do 
#get "invoices/postgl" => "invoices#postgl"
#post "invoices/postgl" => "invoices#postgl"
 post 'postgl'
 #get  'postgl'

#get 'i/:id/:description', to: 'vouchers#interested', as: :interested
end
end


 #get '/add_field', to: 'payments#add_field', as: 'add_field'
  #post '/add_field', to: 'payments#add_field'







#resources :payments do



  # collection do 
#get "invoices/postgl" => "invoices#postgl"
#post "invoices/postgl" => "invoices#postgl"
 #post 'postgl2'
 #get  'postgl2'
 
 
  #post 'payments/:id/insert_into_gledger', to: 'payments#insert_into_gledger'


#get 'i/:id/:description', to: 'vouchers#interested', as: :interested
#end
#end

# config/routes.rb
# resources :banks, only: [:show]
# config/routes.rb
resources :categories, only: [:show]

#resources :payments, only: [:show]

 #post 'payments/insert_into_gledger', to: 'payments#insert_into_gledger'

 #  get 'receipts/:id/insert_into_rcgledger', to: 'receipts#insert_into_rcgledger'
 #  post 'receipts/:id/insert_into_rcgledger', to: 'receipts#insert_into_rcgledger'
   
   
   
 #resources :receipts do
   # collection do 
  #  get 'receipts/:id/insert_into_rcgledger', to: 'receipts#insert_into_rcgledger'
#   post 'receipts/:id/insert_into_rcgledger', to: 'receipts#insert_into_rcgledger'
# end
# end


resources :bankgroups, only: [:index]
#get 'bankgroups/get_myglaccount', to: 'bankgroups#get_myglaccount'
#post 'bankgroups/get_myglaccount', to: 'bankgroups#get_myglaccount'
#get 'bankgroups/:code/get_myglaccount', to: 'bankgroups#get_myglaccount'
#post 'bankgroups/:code/get_myglaccount', to: 'bankgroups#get_myglaccount'

#get 'bankgroups/:posting_group/get_gl_account', to: 'bankgroups#get_gl_account'
# get 'bank_groups/get_glaccount', to: 'bank_groups#get_glaccount'
#post 'bankgroups/get_glaccount', to: 'bankgroups#get_glaccount'
# post 'bankgroups/get_glaccount', to: 'bankgroups#get_glaccount'

#post 'bankgroups/:id/get_glaccount'
#resources :bankgroups do
 #  member do
    #  get 'get_myglaccount'
    #end
  #end


resources :bankgroups, param: :code do
  get 'get_glaccount', on: :member
end

#resources :banks, param: :bank_name do
 # get 'get_bankglaccount', on: :member
#end








#resources :receipts, param: :bank_name do
 
  #  get 'get_bank_details', on: :member

#end


# config/routes.rb
#resources :receipts, only: [:new, :create, :edit, :update] do
 # collection do
   # get :fetch_bank_details
 # end
#end

#resources :receipts, only: [:new, :create, :edit, :update] do
  #collection do
   # get :fetch_bank_details # This ensures it's not treated as an ID for show
  #end
#end


#resources :receipt_lines do
 # get 'update_lookup', on: :collection
#end





#get 'receipt_lines/update_lookup', to: 'receipt_lines#update_lookup'








   # get 'receipts/fetch_accounts', to: 'receipts#fetch_accounts', as: :fetch_receipt_accounts
#post 'receipts/fetch_accounts', to: 'receipts#fetch_accounts', as: :fetch_receipt_accounts
 # get :fetch_bank_details, to: 'receipts#fetch_bank_details', as: :fetch_bank_details


#resources :receipts, only: [:new, :show, :create, :edit, :update, :index]

# Custom routes
#scope :receipts do
# get 'receipts/fetch_accounts', to: 'receipts#fetch_accounts', as: :fetch_receipt_accounts
#post 'receipts/fetch_accounts', to: 'receipts#fetch_accounts', as: :fetch_receipt_accounts
#get :fetch_bank_details, to: 'receipts#fetch_bank_details', as: :fetch_bank_details

#get 'receipts/:id/insert_into_rcgledger', to: 'receipts#insert_into_rcgledger'
#post 'receipts/:id/insert_into_rcgledger', to: 'receipts#insert_into_rcgledger'
 
#end


# Custom routes
#get 'receipts/fetch_accounts', to: 'receipts#fetch_accounts', as: :fetch_receipt_accounts
#get 'receipts/fetch_bank_details', to: 'receipts#fetch_bank_details', as: :fetch_bank_details
#get 'receipts/:id/insert_into_rcgledger', to: 'receipts#insert_into_rcgledger'
#post 'receipts/:id/insert_into_rcgledger', to: 'receipts#insert_into_rcgledger'

# RESTful routes
#resources :receipts, only: [:new, :show, :create, :edit, :update, :index]










#get 'receipts/fetch_accounts', to: 'receipts#fetch_accounts'
#post 'receipts/fetch_accounts', to: 'receipts#fetch_accounts'






#namespace :receipts do
 # get :fetch_bank_details, to: 'receipts#fetch_bank_details', as: :fetch_bank_details
 
# resources :receipt_lines, only: [:update]

 
 
 resources :receipts, only: [:new, :show, :create, :edit, :index, :update, :delete] do
  collection do
    get :fetch_accounts
    get :fetch_bank_details
  end
  member do
    get :insert_into_rcgledger
    post :insert_into_rcgledger
  end
end


#post '/save_receipt_line', to: 'receipt_lines#save_receipt_line'






get '/paymentlines/fetch_account_number', to: 'paymentlines#fetch_account_number'


 get 'dashboards/account_charts', to: 'dashboards#account_charts'


get 'dashboards', to: 'dashboards#index'

  
#resources :receipt_lines do
#  collection do
 #   get :account_options
 # end
#end


# config/routes.rb
#resources :items, only: [:show]



resources :receipt_lines

#resources :receipt_lines, only: [:new, :create]


get 'api/banks', to: 'banks#index'
  get 'api/customers', to: 'customers#index'
  get 'api/chart_of_accounts', to: 'chart_of_accounts#index'

 resources :gledgers, only: [:index] # Only the index action is needed
 

 
 get 'chart_of_accounts', to: 'chart_of_accounts#edit_index'
  post 'chart_of_accounts', to: 'chart_of_accounts#edit_index'
 
# config/routes.rb


#get '/payments/:id/fetch_accountno', to: 'payments#fetch_accountno'
#post 'payments/:id/fetch_accountno', to: 'payments#fetch_accountno'

# get '/payments/:id/fetch_accountno', to: 'payments#fetch_accountno'
 #get '/payments/:id/fetch_accountno', to: 'payments#fetch_accountno'
 
 
resources :roles
resources :permissions
resources :users do
  member do
    get 'assign_roles'
    patch 'update_roles'
  end
end 
 
resources :roles do
  member do
    get 'assign_permissions'
    patch 'update_permissions'
  end
end


# config/routes.rb
resources :payments do
  collection do
    get 'fetch_accountno' # This defines a collection route
  end
end

resources :customers do
  collection do
    get :find_by_name
  end
end

# config/routes.rb
resources :items do
  collection do
    get :find_by_description
  end
  end

#get 'items/find_by_description', to: 'items#find_by_description'
get 'items/find_by_description', to: 'items#find_by_description'

resources :sales_quotes do
    collection do
      get 'get_customer_details'
    end
  end
  
 resources :sales_orders do
    collection do
      get 'get_customer_details'
    end
  end
  

end



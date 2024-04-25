Rails.application.routes.draw do

  resources :gledgers
  resources :products
  resources :charge_types
  resources :chargetypes
  # devise_for :users
  #devise_for :usersresources :invoices


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


devise_for :users
devise_scope :user do
  authenticated :user do
    root 'dashboards#dashboard_1', as: :authenticated_root
  end

  root 'devise/sessions#new'

end


# authenticated :user do

 # root to: 'dashboards#dashboard_1'

# end

      # root :to => "devise/sessions#new"

#root 'dashboards#dashboard_1'
#root to: 'dashboards#dashboard_1'
   
  resources :receipt_lines
  resources :receipts
  resources :paymentlines
  resources :payments
  resources :items
  resources :cashes
  resources :banks
  resources :accharts
  resources :invoice_lines
  resources :invoices
  resources :customers
# You can have the root of your site routed with "root"
  

  # All routes
  get "dashboards/dashboard_1"
  get "dashboards/dashboard_2"
  get "dashboards/dashboard_3"
  get "dashboards/dashboard_4"
  get "dashboards/dashboard_4_1"
  get "dashboards/dashboard_5"

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
  # resources :invoices

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
 get  'postgl'

#get 'i/:id/:description', to: 'vouchers#interested', as: :interested
end
end


 get '/add_field', to: 'payments#add_field', as: 'add_field'
  post '/add_field', to: 'payments#add_field'







resources :payments do



   collection do 
#get "invoices/postgl" => "invoices#postgl"
#post "invoices/postgl" => "invoices#postgl"
 post 'postgl'
 get  'postgl'

#get 'i/:id/:description', to: 'vouchers#interested', as: :interested
end
end




end

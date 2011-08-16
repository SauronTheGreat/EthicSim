Simulation::Application.routes.draw do

  resources :student_group_settings

  match 'bulk_user_import'=>'bulk_import#import'
  match 'import_complete'=>'bulk_import#pick_data'
  match 'all_users'=>'application#all_users'
  match 'messaging_modes'=>'display_messaging#show_modes'
  match 'messaging_display'=>'display_messaging#show_messages'
  match "confirm_settings"=>'student_groups#confirm_game_creation'
  match "download_data"=>'student_groups#download_data'
  match "add_answer"=>'questions#add_answer'



  resources :facilitator_inputs

  get "matrix/index"

  resources :matrix

  resources :player_answers

  resources :players

  resources :games

  resources :student_group_questionnaires

  resources :options

  resources :categories

  resources :types

  resources :questions

  resources :questionnaires

  resources :student_group_users

  resources :student_groups

  resources :facilitator_groups

  resources :facilitators

  resources :clients

  devise_for :users

  resources :welcome
  resources :questionnaire_settings
  match "add_sum"=>'matrix#add_sum'
  get "welcome/index"


  match 'question_selection'=>'questions#selection_for_question'
  match 'use_question'=>'questions#use_question'
  match 'use_question_remove'=>'questions#remove_question'
  match 'use_questionnaire'=>'questionnaires#use_questionnaire'
  match 'createpost'=>'player_answers#createpost'
  match 'list_questions'=>'questionnaires#list_questions'
  match 'questionnaire_selection'=>'questionnaires#questionnaire_selection'
  match 'landing_page'=>'welcome#landing_page'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

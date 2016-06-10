Rails.application.routes.draw do
  resources :rss_feeds do
    collection do
      get "titles"
      get "all_latest_feeds"
      get "reader"
    end
  end
  
  get '/home', to: 'home#index'
  root 'home#index'
  
  get '/admin', to: 'rss_feeds#index'
  
  match '/fhir_client/practitioner', to: 'fhir_client#practitioner', via: :post
  match '/fhir_client/patient', to: 'fhir_client#patient', via: :post

end

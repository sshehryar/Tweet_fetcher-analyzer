Rails.application.routes.draw do
#  get 'home/index'
    match "/index" , to:  "home#index", via: :GET
    match "/tweets",  to: "home#tweet_form",  via: :GET
    match "/load", to: "home#load_tweets", via: :POST
    match "/display" , to: "home#score_search", via: :GET
    
end

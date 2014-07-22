class HomeController < ApplicationController

    def index 
    @tweets = Tweet.all.to_a
    end
    
    def tweet_form
    end
    
    def load_tweets
        
    end    


end

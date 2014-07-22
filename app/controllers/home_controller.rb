class HomeController < ApplicationController

    def index 
    @tweets = Tweet.all.to_a
    end
    
    def tweet_form
    end
    
    def load_tweets
    @load_tweets = Tweet.pull_tweets(params[:hashtag])    
    end    


end

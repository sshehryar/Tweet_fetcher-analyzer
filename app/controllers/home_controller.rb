class HomeController < ApplicationController

    def index 
    @tweets = Tweet.all.to_a
    end
    
    def tweet_form
    end
    
    def load_tweets
    @load_tweets = Tweet.pull_tweets(params[:hashtag])    
    end
    
    def score_search
        p params
        p ".................................."
      
    #@show_tweet = Tweet.where(params[:sentiment] => :score ).to_a 
    #@show_tweet = Tweet.where(sentiment: params[:score]).to_a
#    @show_tweet = Tweet.where(sentiment: 0.5)
    @show_tweet = Tweet.where(:sentiment => params[:sentiment].to_s)
    #@show_tweet = Tweet.where(params[:sentiment] => params[:score.to_s])    
    end


end

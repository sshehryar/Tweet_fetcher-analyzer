class HomeController < ApplicationController

    def index 
    @tweets = Tweet.all.to_a
        #@tweets.each do |update_sent|
        #score = sentiments.score(update_sent["text"])["pos"]
        #update_sent.update_attributes! :sentiment => score 
        end
    end
    
    def tweet_form
    end
    
    def load_tweets
    @load_tweets = Tweet.pull_tweets(params[:hashtag])    
    
    end    


end

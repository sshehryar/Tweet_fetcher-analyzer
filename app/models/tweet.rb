require 'sentiments'
class Tweet
  include Mongoid::Document
   


  field :text,      type: String
  field :sentiment, type: String 
  CONFIG = {:consumer_key=>"BIH1an9uUvcLuz4n8nzTId9rR", :consumer_secret=>"678HNHv3MSFhwjbJoYS2XDZ4z7YHnBsUISJ9gvvem1mKioQ3t5"} 
     
    
    
    def self.pull_tweets hashtag
        client = Twitter::REST::Client.new(CONFIG)
        raw_results = client.search(hashtag)
        #need to convert raw_results to hash
        conv_result_to_hash = raw_results.to_h
        
        
        #########################################################################################################################
        refined_results = conv_result_to_hash[:statuses].collect{|r| r[:text]} 
        tweets_array = refined_results.to_a
        tweets_array.each {|tweet_text| Tweet.create! :text => tweet_text , :sentiment => sentiments.score(tweet_text)["pos"].round(1) }
        end
            
        #########################################################################################################################
        

end


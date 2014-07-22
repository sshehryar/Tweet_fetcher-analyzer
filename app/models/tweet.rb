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
        tweets_array.each {|tweet_text| Tweet.create! :text => tweet_text }
       
        
       
        #puts tweets_array
        end
            
        #########################################################################################################################
        
        
        # tweets will be separated by \n when you filter them out of results
        # all you will havwe to do in order to get them in an array would 
        # variable_name.split("\n")
        # Test code:
        # Tweet.first shows the first stored tweet
        # Tweet.first.update_attributes! :sentiment => "happy" used to update attribute in tweet once the correct sentiment has been matched

       
        ############################################################################################################################

    
      
    
            #tweets_array.each {|tweet_score| Tweet.update_attribute(:sentiment => sentiments.score(tweet_score)["pos"])}
            
    
     ################################################################################################################################   
end


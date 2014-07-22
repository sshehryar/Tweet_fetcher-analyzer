class HomeController < ApplicationController

    def index 
    @tweets = Tweet.all.to_a
    end
    


end

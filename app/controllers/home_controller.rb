class HomeController < ApplicationController
    
    def index 
       StartScrap.new.perform  
    end 

    def show
        Crypto.find(params[:id])
    end 




end

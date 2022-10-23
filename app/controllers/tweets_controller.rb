class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all.order('created_at DESC')
    end
  
    def show
        @tweet = Tweet.find(params[:id])
    end
    def create
        @tweet = Tweet.new(tweets_params)
        if @tweet.save
            redirect_to @tweet, notice: "tweet creado"
        else 
            render :new
            end
    end

    def new
        @tweet = Tweet.new
    end
    private 
        def tweets_params
            params.require(:tweet).permit(:content, :monster_id)
        end
  end

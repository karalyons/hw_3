class PostsController < ApplicationController

    def index 
      @posts = Post.all
    end

    def show
        @post = Post.find_by({ "id" => params["id"] })
        @places = Place.find_by({ "id" => @post["place_id"] })
      end
    
      def new
        @post = Post.new
        @place = Place.find_by[{"id" => params["place_id"]}]
        @post["place_id"] = @place["id"]
      end

      def create
        @post = Post.new
        @post["title"] = params["post"]["title"]
        @post["description"] = params["post"]["description"]
        @post["place_id"] = params["post"]["place_id"]
        @post.save
        redirect_to "/places"
end

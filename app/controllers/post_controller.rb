class PostController < ApplicationController

    def show
        @post = Post.find_by({ "id" => params["id"] })
        @places = Place.find_by({ "id" => @post["place_id"] })
      end
    
      def new
        @post = Post.new
      end
end

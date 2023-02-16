class PlaceController < ApplicationController
    def show
        @post = Post.find_by({ "id" => params["id"] })
        @places = Place.find_by({ "id" => @post["place_id"] })
      end
    
      def new
        @post = Post.new
        @places = Place.find_by({ "id" => params["place_id"] })
        @post["place_id"] = @places["id"]
      end
    
      def create
        @post = Post.new
        @post["title"] = params["posts"]["title"]
        @post["description"] = params["posts"]["description"]
        @post["posted_on"] = params["posts"]["posted_on"]
        @post["place_id"] = params["posts"]["place_id"]
        @post["created_at"] = params["posts"]["created_at"]
        @post["updated_at"] = params["posts"]["updated_at"]
        @post.save
        redirect_to "/places/#{@post["places_id"]}"
      end
end

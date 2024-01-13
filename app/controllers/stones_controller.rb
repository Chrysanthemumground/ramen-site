class StonesController < ApplicationController

before_action :authenticate_user!, only: [:new, :create]

    def index
        
        if params[:search] == nil
            @stones= Stone.all
          elsif params[:search] == ''
            @stones= Stone.all
          else
            @stones = Stone.where("name LIKE ? ",'%' + params[:search] + '%')
          end
          
          if params[:tag_ids]
            @stones = []
            params[:tag_ids].each do |key, value|
              if value == "1"
                tag_stones = Tag.find_by(name: key).stones
                @stones = @stones.empty? ? tag_stones : @stones & tag_stones
              end
            end
          end

    end

    def new
        @stone = Stone.new
      end
    
      def create
        stone = Stone.new(stone_params)
        stone.user_id = current_user.id
        if stone.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @stone = Stone.find(params[:id])
        @comments = @stone.comments
        @comment = Comment.new
      end

      def update
        stone = Stone.find(params[:id])
        if stone.update(stone_params)
          redirect_to :action => "show", :id => stone.id
        else
          redirect_to :action => "new"
        end
      end

      def edit
        @stone = Stone.find(params[:id])
      end

      def destroy
        stone = Stone.find(params[:id])
        stone.destroy
        redirect_to action: :index
      end
    
      private

      def stone_params
        params.require(:stone).permit(:name, :genre, :address, :start_time, :end_time, :impression, :image, :overall, tag_ids: [])
      end

    end

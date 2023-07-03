class UsersController < ApplicationController
   
    def create
        user=User.new(user_params)

        if user.save
            session[:user_id]=user.id
            render json: user, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    
    end
    def show
        if logged_in?
            user = User.find(session[:user_id])
            render json: user, only: [:id, :username, :image_url, :bio], status: :ok
        else
            head :unauthorized
        end
    end
   
    private
    def user_params
        params.permit(:username, :image_url, :bio, :password, :password_confirmation)
    end
    def logged_in?
        session[:user_id].present?
    end
end


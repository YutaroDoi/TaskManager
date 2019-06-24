class Admin::UsersController < ApplicationController

        def index
            @q = User.ransack(params[:q])
            @users = @q.result.page(params[:page])
        end

        def show
            @user = User.find(params[:id])
        end
    
        def new
            @user = User.new
        end
    
        def create
            @user = User.new(user_params)
            if @user.save
                redirect_to tasks_path
                flash[:success] = "新規登録完了！"
            else
                render 'new'
            end
        end
    
        private
          def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
          end
    
    end
    
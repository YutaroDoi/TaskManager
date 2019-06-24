class Admin::UsersController < ApplicationController

        def index
            @q = User.ransack(params[:q])
            # Todo: 仮想カラムを使ってtasks.countでもソートできるようにする 
            @users = @q.result.preload(:tasks).page(params[:page])
        end

        def show
            @user = User.find(params[:id])
            @q = @user.tasks.ransack(params[:q])
            @tasks = @q.result
        end
    
        def new
            @user = User.new
        end
    
        def create
            @user = User.new(user_params)
            if @user.save
                redirect_to admin_users_path
                flash[:success] = "ユーザー作成完了！"
            else
                render 'new'
            end
        end

        def edit
            @user = User.find(params[:id])
        end

        def update
            @user = User.find(params[:id])
            if @user.update_attributes(user_params)
                flash[:success] = "ユーザーを編集しました！"
                redirect_to admin_users_path
            else
                render 'edit'
            end
        end

        def destroy 
            User.find(params[:id]).destroy
            flash[:success] = "ユーザーを削除しました！"
            redirect_to admin_users_path
        end
    
        private
          def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
          end
    
    end
    
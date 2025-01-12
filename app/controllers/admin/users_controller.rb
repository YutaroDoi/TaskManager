# frozen_string_literal: true

class Admin
  class UsersController < ApplicationController
    before_action :route_by_logged_in
    before_action :admin_user

    def index
      @q = User.ransack(params[:q])
      # TODO: 仮想カラムを使ってtasks.countでもソートできるようにする
      @users = @q.result.preload(:tasks).page(params[:page])
    end

    def show
      @user = User.find(params[:id])
      @q = @user.tasks.ransack(params[:q])
      @tasks = @q.result.preload(:labels, :task_labels)
    end

    def new; end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path
        flash[:success] = 'ユーザー作成完了！'
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
        flash[:success] = 'ユーザーを編集しました！'
        redirect_to admin_users_path
      else
        render 'edit'
      end
    end

    def destroy
      @user = User.find(params[:id])
      if @user.destroy
        flash[:success] = 'ユーザーを削除しました！'
      else
        flash[:danger] = '削除できませんでした'
      end
      redirect_to admin_users_path
    end

    private

    def user_params
      params[:user][:admin] = ActiveRecord::Type::Boolean.new.cast(params[:user][:admin])
      params.require(:user).permit(:name, :admin, :email, :password, :password_confirmation)
    end

    def admin_user
      raise NotAdminError unless current_user.admin?
    end
  end
end

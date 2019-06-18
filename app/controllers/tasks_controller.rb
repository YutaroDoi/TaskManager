class TasksController < ApplicationController

    def index
      @tasks = Task.all.order(created_at: "DESC")
    end

    def show
      @task = Task.find(params[:id])
    end

    def new
      @task = Task.new
    end

    def create
      @task = Task.new(task_params)
      if @task.save
        redirect_to root_path
        flash[:success] = "タスクを作成しました！"
      else
        render 'new'
      end
    end

    def edit
      @task = Task.find(params[:id])
    end

    def update
      @task = Task.find(params[:id])
      if @task.update_attributes(task_params)
        flash[:success] = "タスクを編集しました！"
        redirect_to root_path
      else
        render 'edit'
      end
    end

    def destroy
      Task.find(params[:id]).destroy
      flash[:success] = "タスクを削除しました！"
      redirect_to root_path
    end

    private
      def task_params
        params.require(:task).permit(:name, :label, :priority, :expire, :description)
      end
end

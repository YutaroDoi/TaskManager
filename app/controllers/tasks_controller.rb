class TasksController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :route_by_logged_in

    def index
      @q = current_user.tasks.ransack(params[:q])
      @tasks = @q.result.includes(:labels, :task_labels).page(params[:page])
    end

    def show
      @task = current_user.tasks.find(params[:id])
    end

    def new
      @task = current_user.tasks.new
      @label = Label.new
    end

    def create
      @task = current_user.tasks.build(task_params)
      if @task.save
        redirect_to tasks_path
        flash[:success] = "タスクを作成しました！"
      else
        @label = Label.new
        render 'new'
      end
    end

    def edit
      @task = current_user.tasks.find(params[:id])
    end

    def update
      @task = current_user.tasks.find(params[:id])
      if @task.update_attributes(task_params)
        flash[:success] = "タスクを編集しました！"
        redirect_to tasks_path
      else
        @label = Label.new
        render 'edit'
      end
    end

    def destroy
      current_user.tasks.find(params[:id]).destroy
      flash[:success] = "タスクを削除しました！"
      redirect_to tasks_path
    end

    private
      def task_params
        params.require(:task).permit(:name, :label, :priority, :expire, :description, :status, label_ids: [], labels_attributes: [])
      end

      def search_params
        params.require(:q).permit!
      end

end

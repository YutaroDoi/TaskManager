class LabelsController < ApplicationController
   
      def create
        @label = Label.new(label_params)
        if @label.save
          redirect_to new_task_path
          flash[:success] = "ラベルを作成しました！"
        else
            redirect_to new_task_path
        end
      end
  
      def destroy
      end
  
      private
        def label_params
          params.require(:label).permit(:name)
        end
  
  end
  
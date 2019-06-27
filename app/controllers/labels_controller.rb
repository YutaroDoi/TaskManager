# frozen_string_literal: true

class LabelsController < ApplicationController
  def create
    @label = Label.new(label_params)
    flash[:success] = 'ラベルを作成しました！' if @label.save
    redirect_to new_task_path
  end

  def destroy; end

  private

  def label_params
    params.require(:label).permit(:name)
  end
end

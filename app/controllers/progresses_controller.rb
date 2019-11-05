class ProgressesController < ApplicationController

  def create
    @progress = Progress.create(params_int(progress_params))
    if @progress.save
      render :success
    end
  end

  private
  def params_int(progress_params)
    progress_params.each do |key,value|
        progress_params[key]=value.to_i
    end
  end

  def progress_params
    params.permit(:evaluation, :curriculum_id, :drill_id).merge(user_id: current_user.id)
  end

end

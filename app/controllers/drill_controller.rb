class DrillController < ApplicationController

  def index
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "curriculum" && path[:action] == "new"
      @drills = Drill.where(curriculum_id: params[:curriculum_id], ancestry: nil, user_id: current_user.id)
    else
      @drills = Drill.where(curriculum_id: params[:curriculum_id], ancestry: nil).limit(5)
    end
  end

  def show
    @drills = Drill.find(params[:id])
    @drill = @drills.children
  end

  def edit
  end

  def update
  end
  

  def frame
    render layout: false
  end

  def iframe
    render layout: false
  end

end

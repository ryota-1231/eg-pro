class DrillsController < ApplicationController
  respond_to :html

  def index
    path = Rails.application.routes.recognize_path(request.referer)
    if (path[:controller] == "curriculums" && path[:action] == "show")
      @drills = Drill.where(curriculum_id: params[:curriculum_id], ancestry: nil).limit(5)
      @new_drill = ""
    else
      @drills = Drill.where(curriculum_id: params[:curriculum_id], ancestry: nil, user_id: current_user.id)
      @new_drill = "new_drill"
    end
  end

  def new
    @form = Form::DrillCollection.new
    @curriculum_id = params[:curriculum_id]
    @ancestry = Drill.where(curriculum_id: @curriculum_id, ancestry: nil, user_id: current_user.id)
    @ancestry.each do |anc|
      @ancestry_id = anc.id
    end
  end

  def create
    @form = Form::DrillCollection.new(drill_collection_params)
    if @form.save
      redirect_to :curriculum_drills, notice: "# 件の商品を登録しました。"
    else
      render :new
    end
  end

  def show
    @drills = Drill.find(params[:id])
    @drill = @drills.children
  end

  def edit
    @drill = Drill.find(params[:id])
    @drill_children = @drill.children
  end

  def update
    @drills = drill_update_params.keys.each do |id|
      drill = Drill.find(id)
      drill.update(drill_update_params[id])
    end

    respond_with(@drills, location: edit_curriculum_drill_path)
  end

  def frame
    render layout: false
  end

  def iframe
    render layout: false
  end

  private
  def drill_collection_params
    params.require(:form_drill_collection).permit(drills_attributes: Form::Drill::REGISTRABLE_ATTRIBUTES)
  end

  def drill_update_params
    params.require(:drills).permit!
  end

end

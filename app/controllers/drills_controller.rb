class DrillsController < ApplicationController
  respond_to :html
  before_action :authenticate_user!

  def index
    path = Rails.application.routes.recognize_path(request.referer)

    if (path[:controller] == "curriculums" && path[:action] == "show") || (path[:controller] == "drills" && path[:action] == "edit")
      @drills = Drill.where(curriculum_id: params[:curriculum_id], ancestry: nil).limit(5)
      @new_drill = ""
    else
      @drills = Drill.where(curriculum_id: params[:curriculum_id], ancestry: nil, user_id: current_user.id)
      @drill = Drill.new
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
    path = Rails.application.routes.recognize_path(request.referer)
    if (path[:controller] == "drills" && path[:action] == "index")
      @drill_active = Drill.where(title: "#{current_user.name}"+params[:curriculum_id])
      unless @drill_active.present?
        @drill = Drill.new(drill_parent_params)
        @drill.user_id = current_user.id
        @drill.curriculum_id = params[:curriculum_id]
        if @drill.save
          redirect_to :new_curriculum_drill
        end
      else
        redirect_to :new_curriculum_drill
      end
    else
      @form = Form::DrillCollection.new(drill_collection_params)
      if @form.save
        redirect_to :curriculum_drills, notice: "# 件の商品を登録しました。"
      else
        render :new
      end
    end
  end

  def show
    @drills = Drill.find(params[:id])
    @drill = @drills.children
    @drill = @drill.select{ |v| v.drill_present == true}
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
    respond_with(@drills, location: curriculum_drills_path)
  end

  def drill_delete(drill)
    if drill.user_id == current_user.id
      drill.destroy
      redirect_to action: 'new'
    end
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

  def drill_parent_params
    params.require(:drill).permit(:title, :curriculum_id, :discription)
  end

end

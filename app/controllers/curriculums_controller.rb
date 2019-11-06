class CurriculumsController < ApplicationController
  before_action :authenticate_user!, only:[:show, :new]
  def index
    @curriculums = Curriculum.where(ancestry: nil)
  end

  def show
    @curriculum = Curriculum.find(params[:id])
  end

  def new
    @curriculum = Curriculum.where(ancestry: nil)
  end
end

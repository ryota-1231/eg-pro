class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def index
    
  end

  def show
    @user = User.find(current_user.id)
    @drills = @user.drills.where(ancestry: nil).order("RAND()").limit(3)
  end

end



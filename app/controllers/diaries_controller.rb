class DiariesController < ApplicationController

  def index
  end

  def new
    @diary_point = DiaryPoint.new
  end

  def create
    @diary_point = DiaryPoint.new(diary_params)
    if @diary_point.valid?
      @diary_point.save
      redirect_to rootpath
    else
      render :new
    end
  end


  private
  def diary_params
    params.require(:diary_point).permit(:title, :text, :point).merge(user_id: current_user.id)
  end

end

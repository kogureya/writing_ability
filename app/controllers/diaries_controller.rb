class DiariesController < ApplicationController

  def index
    @diary = Diary.includes(:user).order("created_at DESC")
    @point = Point.includes(:user).where(user_id: current_user.id).sum(:point)

  end

  def new
    @diary_point = DiaryPoint.new
  end

  def create
    @diary_point = DiaryPoint.new(diary_params)
    if @diary_point.valid?
      @diary_point.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @diary = Diary.find(params[:id])
  end


  private
  def diary_params
    params.require(:diary_point).permit(:title, :text, :point).merge(user_id: current_user.id)
  end

end

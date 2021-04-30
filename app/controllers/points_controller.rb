class PointsController < ApplicationController

  def index
    @point = ((Point.includes(:user).where(user_id: current_user.id).sum(:point)) - (Feed.includes(:user).where(user_id: current_user.id).sum(:feed_point)))
    @time = Time.now
    if Feed.exists?(user_id: current_user.id)
      @lastfeed = Time.zone.now - (Feed.includes(:user).where(user_id: current_user.id).order(:created_at).last.created_at)
    end
  end

end

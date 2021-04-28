class PointsController < ApplicationController

  def index
    @point = ((Point.includes(:user).where(user_id: current_user.id).sum(:point)) - (Feed.includes(:user).where(user_id: current_user.id).sum(:feed_point)))
    @time = Time.now
    @lastfeed = Feed.includes(:user).where(user_id: current_user.id).order(:created_at).last.created_at.in_time_zone('Tokyo').strftime('%Y/%m/%d %H:%M:%S')
  end

end

class FeedsController < ApplicationController

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.create(feed_params)
    redirect_to points_path
  end

  private
  def feed_params
    params.permit(:feed_point).merge(user_id: current_user.id)
  end

end

class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  		@vehicle = current_user.vehicles.build
  		@vehicles = current_user.vehicles.paginate(page: params[:page])
  		@feed_items = current_user.feed.paginate(page: params[:page])
  	end
  end

  def help
  end

  def about
  end

  def contact
  end
end

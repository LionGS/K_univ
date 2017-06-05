class HomeController < ApplicationController
  def index
    @allpost = Post.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
  end
end

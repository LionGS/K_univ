class PostsController < ApplicationController
  before_action :authenticate_user!, except: :new
  
  def list
    # 게시판 목록기능 [참고 : http://destiny738.tistory.com/538]
    @allpost = Post.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
  end

  def new
  end

  def create
    Post.create(user_id: current_user.id, title: params[:my_title], content: params[:my_content])
    redirect_to '/posts/list'
  end

  def show
    @findpost = Post.find(params[:post_id])
  end


  def edit
    @edit_post = Post.find(params[:post_id])
  end

  def update
    @update_post = Post.find(params[:post_id])
    @update_post.title = params[:my_title]
    @update_post.content = params[:my_content]
    @update_post.save
    
    redirect_to "/posts/show/#{@update_post.id}"
  end

  def delete
    @delete_post = Post.find(params[:post_id])
    @delete_post.destroy
    
    redirect_to "/posts/list"
  end

end

class PostsController < ApplicationController
  respond_to :json
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    if params.key? :type
      @posts = @posts.send Post::TYPE_VALUES.values.find(->{:none}, &params[:type].method(:==))
    end
    respond_with @posts
  end

  def show
    @post = Post.find(params[:id])
    respond_with @post
  end

  def create
    @post = Post.create(params[:post])
    respond_with @post
  end

  def update
    @post = Post.update(params[:id], params[:post])
    respond_with @post
  end

  def destroy
    @post = Post.destroy(params[:id])
    respond_with @post
  end


end

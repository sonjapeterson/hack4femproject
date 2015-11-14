class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post_url(post.id)
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :should_tweet, :tweet_body)
  end
end

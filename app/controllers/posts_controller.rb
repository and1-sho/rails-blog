class PostsController < ApplicationController
  # 一覧
  def index
    @posts = Post.all
  end

  #　新規投稿 
  def new
    @post = Post.new
  end

  # 投稿処理
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path 
    else
      render :new
    end
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end
end

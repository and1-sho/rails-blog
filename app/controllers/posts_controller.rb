class PostsController < ApplicationController
  # 一覧
  def index
    @posts = Post.all
  end

  #　新規投稿 
  def new
    @post = Post.new
  end

  # 新規の登録処理
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path 
    else
      render :new
    end
  end

  # 編集
  def edit
    @post = Post.find(params[:id])
  end

  # 編集の登録処理
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path 
    else
      render :edit
    end
  end

  # 削除
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end
end

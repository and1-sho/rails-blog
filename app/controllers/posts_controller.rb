class PostsController < ApplicationController
  # ログインユーザーのみ実行できるようにする設定
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_own_post, only: [:edit, :update, :destroy]

  # 一覧
  def index
    @posts = Post.includes(:user).all
  end

  # 詳細
  def show
    @post = Post.find(params[:id])
  end

  #　新規投稿 
  def new
    @post = Post.new
  end

  # 新規の登録処理
  def create
    # current_userをつけると今操作しているuser_idが自動で入るようになる
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: "投稿しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # 編集
  def edit
    
  end

  # 編集の登録処理
  def update
    
    if @post.update(post_params)
      redirect_to posts_path, notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # 削除
  def destroy
    @post.destroy
    redirect_to posts_path, notice: "削除しました"
  end


  private

  # セキュリティ（フィルター）
  def post_params
    params.require(:post).permit(:content)
  end

  # ログインしているユーザーの投稿の中から、URLパラメータのidの投稿を取得する
  def set_own_post
    @post = current_user.posts.find(params[:id])
  end
end

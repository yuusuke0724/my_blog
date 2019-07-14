class PostsController < ApplicationController
  def index
   # 記事一覧用
    @posts = Post.all
    # 最新記事用
    @new_posts = Post.all
    
  end
 
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "ブログを登録しました。"
    else
      render :new 
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "ブログを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "ブログを削除しました。"
  end



private

def post_params
    params.require(:post).permit(:title, :body, :category)
end


end

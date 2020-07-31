class PostsController < ApplicationController
  before_action :basic_auth

  def index
    @posts = Post.all.order(id: "DESC")
  end

  def create
    Post.create(content: params[:content])
    redirect_to action: :index
  end

  def checked

    post = Post.find(params[:id])
    if post.checked then
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
  end

private

def basic_auth
  authenticate_or_request_with_http_basic do |username, password|
    username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
  end
end
end
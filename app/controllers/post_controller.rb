class PostController < ApplicationController
  before_action :authenticate_user!, except: [:index] #authenth...로그인을 했는지 판별해주는 것. before...는 auth를 먼저 실행시켜 주는 것이다.


  def new
  end

  def create
    newPost = Post.new
    newPost.title = params[:title]
    newPost.content = params[:content]
    newPost.user = current_user
    if params[:avatar]
      newPost.avatar = params[:avatar]
    end
    newPost.save
    
    # newPost = Post.create(title: paramrs[:title], content: params[:content])
    
    # redirect_to '/'
    redirect_to "/show/#{newPost.id}"
  end

  def destroy
    destroyPost = Post.find(params[:id])
    destroyPost.destroy
    
    redirect_to '/'
  end

  def index
    @listPost = Post.all
  end

  def show
    @showPost = Post.find(params[:id])
  end

  def edit
    @editPost = Post.find(params[:id])
  end

  def update
    updatePost = Post.find(params[:id])
    updatePost.title = params[:title]
    updatePost.content = params[:content]
    updatePost.save
    
    # updatePost.update(title: params[:title], content: params[:content])
    
    # redirect_to '/'
    redirect_to "/show/#{updatePost.id}"
  end
end

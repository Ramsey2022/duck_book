class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.order(datetime: :desc).first(5)
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new
    @post.content = params[:post][:content]
    @post.author = current_user
    @post.datetime = Datetime.now

    respond_to do |format|
      if @post.save
        format.turbo_stream { render :create, locals: { post: @post } }
      else
        format.html {
          render :index, status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.turbo_stream { render :delete }
    end
  end

end

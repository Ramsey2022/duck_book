class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.order(datetime: :desc).first(5)
    @incoming_requests = Friendship.where(friend_id: current_user.id).where(status: 'pending')
  end

  def show
    @post = Post.find(params[:id])
  end

  def likes_list
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new
    @post.content = params[:post][:content]
    @post.author = current_user
    @post.datetime = DateTime.now

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
    destroy_posts_notifications(@post)
    @post.destroy    

    respond_to do |format|
      format.turbo_stream { render :delete }
    end
  end

  private

  def destroy_posts_notifications(post)
    post.comments.each do |comment|
      Notification.where(comment_id: comment.id).destroy_all
    end

    post.likes.each do |like|
      Notification.where(like_id: like.id).destroy_all
    end
  end
end

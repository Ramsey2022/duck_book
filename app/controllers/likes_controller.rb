class LikesController < ApplicationController
  def create
    @like = Like.new(post_id: params[:post_id], user_id: current_user.id)

    if @like.post.likes.any? { |like| like.user_id == current_user.id }
      return
    else
      @like.save
      @post = @like.post

      unless current_user.id == @post.author.id
        Notification.create(
          notification_type: 'like',
          actor_id: current_user.id,
          notifier_id: @post.author.id,
          like_id: @like.id
        )
      end

      respond_to do |format|
        format.turbo_stream { render :create, post: @post }
      end
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    @post = like.post

    notification = Notification.where(like_id: like.id)
    notification.destroy_all

    respond_to do |format|
      format.turbo_stream { render :create, post: @post }
    end
  end
end

class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.build(
      author_id: current_user.id,
      content: params[:comment][:content]
    )
    if comment.save
      @post = post
      @comment = comment

      unless current_user.id == @post.author.id
        Notification.create(
          notification_type: 'comment',
          actor_id: current_user.id,
          notifier_id: @post.author.id,
          comment_id: @comment.id
        )
      end

      respond_to do |format|
        format.turbo_stream { render :create, comment: @comment }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

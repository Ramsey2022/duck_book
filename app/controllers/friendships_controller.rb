class FriendshipsController < ApplicationController
  def create
    friendship = Friendship.new(
      user_id: current_user.id,
      friend_id: params[:id],
      status: 'pending'
    )
    friendship.save

    Notification.create(
      notification_type: 'friendship',
      actor_id: current_user.id,
      notifier_id: friendship.friend.id,
      friendship_id: friendship.id
    )

    redirect_back(fallback_location: root_path)
  end

  def destroy 
    user = User.find(params[:id])
    friendship1 = Friendship.where(user_id: current_user.id)
                            .where(friend_id: user.id)
    friendship2 = Friendship.where(user_id: user.id)
                            .where(friend_id: current_user.id)
    friendship1.destroy_all
    friendship2.destroy_all

    redirect_to user_path(params[:id])
  end
end

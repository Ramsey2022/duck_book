class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @friend_status = get_friend_status
  end

  def friend_list
    @user = User.find(params[:id])
  end

  private

  def get_friend_status
    if current_user.friendships.where(friend_id: @user.id).any?
      return current_user.friendships.where(friend_id: @user.id).first.status
    elsif @user.friendships.where(friend_id: current_user.id).any?
      return 'respond'
    else
      return 'none'
    end
  end 
end

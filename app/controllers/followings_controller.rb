# frozen_string_literal: true

class FollowingsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    current_user.follow(params[:user_id]) unless current_user.following?(user)
    redirect_to controller: :users, action: :show, id: params[:user_id]
  end

  def destroy
    user_id = Following.find(params[:id]).followed_user_id
    Following.find(params[:id]).destroy
    redirect_to controller: :users, action: :show, id: user_id
  end
end

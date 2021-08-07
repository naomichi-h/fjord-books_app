# frozen_string_literal: true

class FollowingsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    current_user.follow(params[:user_id]) unless current_user.following?(user)
    redirect_to controller: :users, action: :show, id: params[:user_id]
  end

  def destroy
    Following.find(params[:id]).destroy
    redirect_to controller: :users, action: :show, id: params[:id]
  end
end

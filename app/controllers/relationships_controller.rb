class RelationshipsController < ApplicationController
  def create
    user = User.find_by_id(params[:user_id])
    current_user.follow(params[:user_id]) unless current_user.following?(user)
    redirect_to root_path
  end

  def destroy
    Relationship.find(params[:id]).destroy
    redirect_to root_path
  end

end

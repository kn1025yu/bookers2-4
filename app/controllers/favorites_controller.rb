class FavoritesController < ApplicationController

  def create
    user = User.find(params[:user_id])
    favorite = current_user.favorites.new(user_id: user.id)
    favorite.save
    redirect_to user_path(user)
  end

  def destroy
    user = User.find(params[:user_id])
    favorite = current_user.favorites.find_by(user_id: user.id)
    favorite.destroy
    redirect_to user_path(user)
  end

end

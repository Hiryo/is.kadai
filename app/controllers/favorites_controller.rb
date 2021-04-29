class FavoritesController < ApplicationController
  def index
  end

  def create
    favorite = current_user. favorites.create(blog_id: params[:blog_id])
    redirect_to blogs_path, notice: "#{favorite.blog.user.name}'s blogs is added to your favorite"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).def destroy
    redirect_to blogs_path, notice: "#{favorite.blog.user.name}'s blogs is removed from your favorite"
  end
end

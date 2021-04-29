class BlogsController < ApplicationController
  before_action : :set_blog, only: [:show, :edit, :update, :destroy]
  def new
    @blogs = Blog.new
  end

  def index
    @blog = Blog.all
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "Sending"
      else
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blog_path, notice: "Editing"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "Deletion"
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content, :user_id, :image, :image_cache)
  end

  def set_blog
    @blog = Blog.find(params.require[:id])
  end
end

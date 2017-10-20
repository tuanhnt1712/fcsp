class UserCoversController < ApplicationController
  before_action :authenticate_user!
  load_resource :image, through: :current_user, parent: false, only: :update

  def create
    create_cover
    redirect_to user_path current_user
  end

  def update
    update_cover
    redirect_to user_path current_user
  end

  private

  def create_cover
    image = current_user.images.build picture: params[:picture]
    if image.save && current_user.update(cover_image_id: image.id)
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
  end

  def update_cover
    if current_user.update cover_image_id: params[:image_id]
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
  end
end

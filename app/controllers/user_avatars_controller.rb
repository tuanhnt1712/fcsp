class UserAvatarsController < ApplicationController
  before_action :authenticate_user!
  load_resource :image, through: :current_user, parent: false, only: :update

  def create
    create_avatar
    redirect_to user_path current_user
  end

  def update
    update_avatar
    redirect_to user_path current_user
  end

  private

  def create_avatar
    image = current_user.images.build picture: params[:picture]
    if image.save && current_user.update(avatar_id: image.id)
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
  end

  def update_avatar
    if current_user.update avatar_id: @image.id
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
  end
end

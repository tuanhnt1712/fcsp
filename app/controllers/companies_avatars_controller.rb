class CompaniesAvatarsController < ApplicationController
  load_resource only: %i(create update)

  def create
    @image = @company.images.build picture: params[:picture]
    if @image.save
      @company.update_attributes avatar_id: @image.id
      flash[:success] = t "companies.avatar.success"
    else
      flash[:danger] = t "companies.avatar.danger"
    end
    redirect_to @company
  end

  def update
    @company.update_attributes avatar_id: params[:image_id]
    flash[:success] = t "companies.avatar.success"
    redirect_to @company
  end
end

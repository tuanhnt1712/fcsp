class CompaniesCoverController < ApplicationController
  load_resource :company, only: %i(create update)

  def create
    @image = @company.images.build picture: params[:picture]
    if @image.save
      @company.update_attributes cover_image_id: @image.id
      flash[:success] = t "companies.cover.success"
    else
      flash[:danger] = t "companies.cover.danger"
    end
    redirect_to @company
  end

  def update
    @company.update_attributes cover_image_id: params[:image_id]
    flash[:success] = t "companies.cover.success"
    redirect_to @company
  end
end

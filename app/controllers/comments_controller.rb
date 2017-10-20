class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_resource :post, parent: false, except: %i(create update show)
  load_resource through: :current_user, parent: false, only: %i(destroy update edit)

  def create
    @comment = @post.comments.build comment_params
    if @comment.save
      get_list_comment
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = t ".create_failed"
      respond_to user_post_path params[:user_post_id]
    end
  end

  def destroy
    if @comment.destroy
      load_post
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = t ".destroy_failed"
      respond_to user_post_path params[:user_post_id]
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    if @comment.update_attributes comment_params
      get_list_comment
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = t ".update_failed"
      respond_to user_post_path params[:user_post_id]
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content, :user_id
  end

  def get_list_comment
    @comments = @post.comments.newest
  end
end

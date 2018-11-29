class PostsController < ApplicationController
  before_action :authenticate_user
  respond_to :json

  def create
    post = Post.create(
      caption: params[:caption],
      upvotes: params[:upvotes],
      media_url: params[:media_url],
      user_id: params[:user_id]
    )

    head :created
  end

  private

  def authenticate_user
    render :json => { :response => 'User unauthorized to acces post for another user' },
      :status => 403 unless current_user.id == params[:user_id].to_i
  end
end
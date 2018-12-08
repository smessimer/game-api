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

  def index
    render json: Post.where(user_id: user_ids)
  end

  private

  def authenticate_user
    render :json => { :response => 'User unauthorized to acces post for another user' },
      :status => 403 unless current_user.id == params[:user_id].to_i
  end

  def relationships
    Relationship.where('user_1_id = ? or user_2_id = ?', current_user.id, current_user.id).each
  end

  def friend_ids 
    relationships.map do |relationship|
      relationship.user_1_id unless relationship.user_1_id == current_user.id
      relationship.user_2_id unless relationship.user_2_id == current_user.id
    end
  end

  def user_ids
    friend_ids.push(current_user.id)
  end
end
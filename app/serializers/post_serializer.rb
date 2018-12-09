class PostSerializer < ActiveModel::Serializer
  attributes :id, :caption, :upvotes, :media_url, :steam_user

  def steam_user
    object.user.steam_user
  end
end

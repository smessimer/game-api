class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :updated_at, :test

  has_one :steam_user

  def test
    'teafjekafl;jeaflkj'
  end
end
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
          :jwt_authenticatable,
          :registerable,
          :rememberable,
          jwt_revocation_strategy: JWTBlacklist
      
  has_one :steam_user
  has_many :relationships

  def remember_me
    true
  end
end

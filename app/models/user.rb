class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
          :jwt_authenticatable,
          :registerable,
        jwt_revocation_strategy: JWTBlacklist
end

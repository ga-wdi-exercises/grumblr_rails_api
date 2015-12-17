class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
    # removed those not used by our api, :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
end

class User < ApplicationRecord
  has_secure_password

  has_many :yarns, dependent: :destroy
end

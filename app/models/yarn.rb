class Yarn < ApplicationRecord
  belongs_to :user

  has_many :knots
end

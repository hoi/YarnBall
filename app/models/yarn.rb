class Yarn < ApplicationRecord


  ### CONSTANTS ###

  UNSORTED_NAME = "00_unsorted"



  ### ASSOCIATIONS ###

  belongs_to :user
  has_many :knots



  ### SCOPES ###

  default_scope { order(:name) }

end

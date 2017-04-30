class Knot < ApplicationRecord

  REPEAT_NEVER = "never"
  REPEAT_WEEKLY = "weekly"
  REPEAT_MONTHLY = "monthly"
  REPEAT_QUARTERLY = "quarterly"
  REPEAT_YEARLY = "yearly"

  belongs_to :yarn
end

class Knot < ApplicationRecord

  REPEAT_NEVER = "never"
  REPEAT_WEEKLY = "weekly"
  REPEAT_MONTHLY = "monthly"
  REPEAT_QUARTERLY = "quarterly"
  REPEAT_YEARLY = "yearly"

  VALID_REPEATS = [REPEAT_NEVER, REPEAT_WEEKLY, REPEAT_MONTHLY, REPEAT_QUARTERLY, REPEAT_YEARLY]

  belongs_to :yarn
end

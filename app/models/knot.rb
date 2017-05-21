class Knot < ApplicationRecord


  ### CONSTANTS ###

  REPEAT_NEVER = "never"
  REPEAT_WEEKLY = "weekly"
  REPEAT_MONTHLY = "monthly"
  REPEAT_QUARTERLY = "quarterly"
  REPEAT_YEARLY = "yearly"

  VALID_REPEATS = [REPEAT_NEVER, REPEAT_WEEKLY, REPEAT_MONTHLY, REPEAT_QUARTERLY, REPEAT_YEARLY]



  ### ASSOCIATIONS ###

  belongs_to :yarn



  ### VALIDATIONS ###

  validates :yarn, :details, presence: true
  validates :repeat, presence: true, inclusion: {in: VALID_REPEATS, message: "must be one of #{VALID_REPEATS.join(", ")}"}



  ### CALLBACKS ###

  after_initialize :set_defaults



  ### INSTANCE METHODS ###


  private


  def set_defaults
    self.repeat ||= REPEAT_NEVER
    self.happens_at ||= Date.today
    self.done ||= false
  end

end

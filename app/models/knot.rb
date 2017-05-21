class Knot < ApplicationRecord


  ### CONSTANTS ###

  REPEAT_NEVER = "never"
  REPEAT_WEEKLY = "weekly"
  REPEAT_MONTHLY = "monthly"
  REPEAT_QUARTERLY = "quarterly"
  REPEAT_YEARLY = "yearly"

  VALID_REPEATS = [REPEAT_NEVER, REPEAT_WEEKLY, REPEAT_MONTHLY, REPEAT_QUARTERLY, REPEAT_YEARLY]

  GENERATE_SERIES_YEARS = 2
  REFRESH_SERIES_MONTHS = 12



  ### ASSOCIATIONS ###

  belongs_to :yarn



  ### SCOPES ###

  default_scope { order(:happens_at) }



  ### VALIDATIONS ###

  validates :yarn, :details, presence: true
  validates :repeat, presence: true, inclusion: {in: VALID_REPEATS, message: "must be one of #{VALID_REPEATS.join(", ")}"}



  ### CALLBACKS ###

  after_initialize :set_defaults



  ### INSTANCE METHODS ###


  def refresh_series
    if repeat != REPEAT_NEVER && series_id.nil?
      series = Series.create!
      self.series_id = series.id
      save!
    end

    knots = Knot.where(series_id: series_id).where("happens_at > ?", happens_at)

    knots.destroy_all

    if (repeat == REPEAT_WEEKLY)
      diff = 1.week
    elsif (repeat == REPEAT_MONTHLY)
      diff = 1.month
    elsif (repeat == REPEAT_QUARTERLY)
      diff = 3.monts
    elsif (repeat == REPEAT_YEARLY)
      diff = 1.year
    end

    current_date = happens_at

    while current_date < GENERATE_SERIES_YEARS.years.from_now
      current_date += diff

      Knot.create!(yarn_id: yarn_id, details: details, happens_at: current_date, repeat: repeat, done: false, series_id: series_id)
    end
  end


  private


  def set_defaults
    self.repeat ||= REPEAT_NEVER
    self.happens_at ||= Date.today
    self.done ||= false
  end

end

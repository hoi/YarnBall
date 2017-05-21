class KnotsController < ApplicationController
  before_action :set_knot, only: [:edit, :update, :done]

  def index
    yarn_ids = current_user.yarns.map(&:id)
    @knots = Knot.where(yarn_id: yarn_ids).where(done: false).order(happens_at: :asc).limit(20)

    # TODO: turn this into a background job
    if (current_user.last_refreshed_at.nil? || current_user.last_refreshed_at < Knot::REFRESH_SERIES_MONTHS.months.ago)
      series_ids = []
      knots = Knot.where(done: false).where.not(repeat: Knot::REPEAT_NEVER).order(happens_at: :asc)
      knots.each do |knot|
        if !series_ids.include?(knot.series_id)
          knot.refresh_series
          series_ids << knot.series_id
        end
      end

      current_user.last_refreshed_at = Date.today
      current_user.save!
    end
  end


  def new
    @knot = Knot.new
    puts "Yarn: " + params[:yid]
    @knot.yarn = params[:yid].present? ? current_user.yarns.find(params[:yid]) : current_user.yarns.find_by(name: Yarn::UNSORTED_NAME)
    puts @knot.yarn_id
  end


  def create
    @knot = Knot.create!(knot_params)

    if (knot_params[:repeat] != Knot::REPEAT_NEVER)
      series = Series.create!
      @knot.series_id = series.id
      @knot.save!
    end

    redirect_to "/knots"
  end


  def edit
  end


  def update
    @knot.update(knot_params)

    @knot.refresh_series

    redirect_to "/yarns/#{@knot.yarn_id}"
  end


  def done
    @knot.done = !@knot.done
    @knot.save!

    redirect_to "/yarns/#{@knot.yarn_id}"
  end


  private


  def set_knot
    @knot = Knot.find(params[:id])
  end


  def knot_params
    params.require(:knot).permit(:yarn_id, :details, :happens_at, :repeat)
  end

end

class KnotsController < ApplicationController
  before_action :set_knot, only: [:edit, :update, :done]

  def index
    yarn_ids = current_user.yarns.map(&:id)
    @knots = Knot.where(yarn_id: yarn_ids).where(done: false).order(happens_at: :asc).limit(20)
  end


  def new
    @knot = Knot.new
    @knot.yarn = current_user.yarns.find_by(name: Yarn::UNSORTED_NAME)
  end


  def create
    @knot = Knot.create!(knot_params)

    redirect_to "/knots"
  end


  def edit
  end


  def update
    @knot.update(knot_params)

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

class KnotsController < ApplicationController

  def index
    yarn_ids = current_user.yarns.map(&:id)
    @knots = Knot.where(yarn_id: yarn_ids).where(done: false).order(happens_at: :asc).limit(20)
  end


  def new
    @knot = Knot.new
    @knot.yarn = @root
  end


  def create
    @knot = Knot.create!(knot_params)

    redirect_to "/knots"
  end


  private


  def knot_params
    params.require(:knot).permit(:yarn_id, :details, :happens_at, :repeat)
  end

end

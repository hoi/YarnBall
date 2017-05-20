class KnotsController < ApplicationController

  def index
    yarn_ids = current_user.yarns.map(&:id)
    @knots = Knot.where(yarn_id: yarn_ids).where(done: false).order(happens_at: :asc).limit(20)
  end

end

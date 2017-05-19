class KnotsController < ApplicationController

  def new
    @yarns = Yarn.all
  end

end

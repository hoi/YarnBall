class YarnsController < ApplicationController

  def show
    @yarn = current_user.yarns.find(params[:yarn_id])
    @parent = current_user.yarns.find_by(id: @yarn.pid) if @yarn.pid.present?
    @children = current_user.yarns.where(pid: params[:yarn_id])
  end

end

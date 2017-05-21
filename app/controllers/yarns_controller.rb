class YarnsController < ApplicationController

  def show
    @yarn = current_user.yarns.find(params[:yarn_id])
    @parent = current_user.yarns.find_by(id: @yarn.pid) if @yarn.pid.present?
    @children = current_user.yarns.where(pid: params[:yarn_id])
    @new_yarn = Yarn.new(pid: @yarn.id)
  end


  def create
    @yarn = current_user.yarns.create!(yarn_params)

    redirect_to "/yarns/#{@yarn.pid}"
  end


  private


  def yarn_params
    params.require(:yarn).permit(:pid, :name)
  end

end

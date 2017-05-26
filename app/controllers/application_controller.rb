class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token

  before_action :verify_current_user, :get_root

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user


  def verify_current_user
    current_user.present?
  rescue
    redirect_to '/login'
  end


  def get_root
    @root = current_user.yarns.find_by(pid: nil)
  rescue
    @root = Struct.new("DummyYarn", :id).new(0)
  end

end

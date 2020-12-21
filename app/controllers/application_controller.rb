class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:home, :policy, :contact]

  protected

  def after_update_path_for(resource)
    users_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end

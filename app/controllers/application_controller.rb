# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    books_path # ログイン後に遷移するpath
  end

  def after_sign_out_path_for(resource)
    new_user_session_path # ログアウト後に遷移するpath
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :zip, :address, :profile])
  end
end

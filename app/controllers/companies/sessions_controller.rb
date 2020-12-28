# frozen_string_literal: true

class Companies::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  def new_guest_company
    company = Company.login
    sign_in company
    redirect_to companies_articles_path
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:company_name, :company_name_kana, :email, :postal_code, :address, :phone_number, :introduction, :staff])
  end
end

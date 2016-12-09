# coding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :set_locale

  def set_locale
  	if params.has_key?(:locale)
  		I18n.locale = params[:locale]
  	elsif I18n.locale.nil?
  		I18n.locale = I18n.default_locale
  	end
  end
end

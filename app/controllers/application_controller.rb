require "application_responder"

class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_paper_trail_whodunnit
  before_action :set_honeybager_context

  self.responder = ApplicationResponder
  respond_to :html

  helper_method :registered?
  helper_method :current_user
  helper_method :current_registration
  helper_method :base_navigation_path
  helper_method :in_mercury_invasion?
  helper_method :simple_registration?

  layout(lambda do |c|
    if c.respond_to?(:current_page) && c.template_exists?(c.current_page.template, 'layouts')
      c.current_page.template
    else
      'application'
    end
  end)

  protect_from_forgery with: :exception, prepend: true

  before_action :store_location

  private

  def store_location
    return unless request.get?
    return if devise_controller?
    return if request.xhr?
    session[:previous_url] = request.fullpath
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(email remember_me name password password_confirmation))
    devise_parameter_sanitizer.permit(:account_update, keys: %i(name description))
  end

  def registered?
    current_registration.present?
  end

  def ensure_admin!
    redirect_to main_app.new_user_session_path unless current_user && current_user.is_admin?
  end

  def ensure_registered!
    redirect_to main_app.new_registration_path unless current_registration
  end

  def current_registration
    current_user && current_user.current_registration
  end

  def simple_registration?
    request.user_agent =~ /DSWKiosk/ ||
      cookies.signed[:simple_registration] == true
  end

  def base_navigation_path
    request.fullpath.split('/')[1] || 'home'
  end

  def user_for_paper_trail
    if user_signed_in?
      current_user.id
    else
      'Unknown user'
    end
  end

  def set_honeybager_context
    if user_signed_in?
      Honeybadger.context({
        user_id: current_user.id,
        user_email: current_user.email
      })
    end
  end

  def after_sign_in_path_for(user)
    if session[:previous_url]
      session[:previous_url]
    elsif user.registered?
      main_app.schedules_path
    elsif AnnualSchedule.registration_open?
      main_app.register_path
    elsif AnnualSchedule.cfp_open?
      main_app.new_submission_path
    elsif AnnualSchedule.voting_open?
      main_app.submissions_path
    elsif user.is_admin?
      main_app.admin_root_path
    else
      main_app.root_path
    end
  end
end

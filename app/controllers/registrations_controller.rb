class RegistrationsController < ApplicationController

  before_action :check_registration_open, except: [ :closed ]
  before_action :authenticate_user!, unless: :simple_registration?, except: [ :closed ]
  before_action :check_existing_registration, unless: :simple_registration?, except: [ :closed ]
  before_action :save_after_registration_path, unless: :simple_registration?, except: [ :closed ]

  def new
    redirect_to closed_registration_path unless AnnualSchedule.registration_open?
    registration_attributes = { contact_email: current_user.try(:email) }.merge(registration_params)
    @registration = Registration.new(registration_attributes)
  end

  def create
    if simple_registration?
      password = SecureRandom.hex
      @registration = Registration.new(registration_params)
      @registration.user = User.where(email: registration_user_params[:email]).first_or_initialize do |u|
        u.assign_attributes(password: password,
                            password_confirmation: password,
                            name: registration_user_params[:name])
      end
    else
      @registration = current_user.registrations.build(registration_params)
    end
    if @registration.save
      redirect_to (session.delete(:after_registration_path) || schedules_path),
                  notice: 'Thanks for registering! You will receive a confirmation e-mail shortly.'
    else
      respond_with @registration
    end
  end

  private

  def registration_params
    params.fetch(:registration, {}).permit(:year,
                                           :zip,
                                           :company_name,
                                           :gender,
                                           :primary_role,
                                           :age_range,
                                           :learn_more_pledge_1p,
                                           :track_id)
  end

  def registration_user_params
    params.fetch(:registration, {}).permit(:name,
                                           :email)
  end

  def check_registration_open
    redirect_to closed_registration_path unless AnnualSchedule.registration_open?
  end

  def check_existing_registration
    redirect_to schedules_path if registered?
  end

  def save_after_registration_path
    if params[:after_registration_path].present?
      session[:after_registration_path] = params[:after_registration_path]
    end
  end
end

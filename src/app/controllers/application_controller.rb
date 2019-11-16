class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_title

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [
        :name, :type, :institution, :registration, :title, :field_id
      ]
    )
  end

  private

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end

  def set_title
    @page_title = I18n.t(
      '.title',
      scope: [controller_name, action_name],
      default: I18n.t('default.title')
    )
  end
end

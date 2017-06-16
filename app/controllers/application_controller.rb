class ApplicationController < ActionController::Base
  before_action :cors_preflight_check
  after_action :cors_set_access_control_headers

  protected

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
    end
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
  end
end

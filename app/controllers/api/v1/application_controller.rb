class Api::V1::ApplicationController < ApplicationController
  after_filter :cors_set_access_control_headers

  def cors_set_access_control_headers
    response.headers['X-XSS-Protection'] = "0"
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Headers'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end
end

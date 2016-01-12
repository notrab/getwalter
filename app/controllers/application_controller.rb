class ApplicationController < ActionController::Base
  include Clearance::Controller

  protect_from_forgery with: :exception

  def angular
    render layout: 'layouts/angular'
  end
end

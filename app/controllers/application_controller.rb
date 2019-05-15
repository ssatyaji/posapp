class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url
  end
end

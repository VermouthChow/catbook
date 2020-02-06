class ApplicationController < ActionController::Base
  include ActionController::ImplicitRender
  include ActionView::Layouts
  
  protect_from_forgery with: :exception
end

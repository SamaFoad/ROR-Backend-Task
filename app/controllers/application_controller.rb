class ApplicationController < ActionController::Base
    include ExceptionHandler
    protect_from_forgery with: :null_session
end

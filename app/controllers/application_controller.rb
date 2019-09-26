class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :left_aside

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    end

    def left_aside
      @classifications = BirdList.all
      #@classifications = Classification.all.order('id ASC').limit(1)
      @bird = Post.where('name LIKE(?)', "%#{params[:bird]}%").order('created_at DESC').page(params[:page]).per(6)
    end

end
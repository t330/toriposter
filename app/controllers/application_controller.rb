class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :left_aside
  before_action :right_aside

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    end

    def left_aside
      @classifications = BirdList.all
      #@classifications = Classification.all.order('id ASC').limit(1)
      @bird = Post.where('name LIKE(?)', "%#{params[:bird]}%").order('created_at DESC').page(params[:page]).per(6)
    end

    def right_aside
      @bird_locations = Post.all.order('created_at DESC').limit(1)
    end

end
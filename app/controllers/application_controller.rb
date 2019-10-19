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
      @bird = Post.where('name LIKE(?)', "%#{params[:bird]}%").order('created_at DESC').page(params[:page]).per(6)
    end

    #def right_aside
    #  @bird_locations = Post.all.order('created_at DESC').limit(5)
    #  @location1 = @bird_locations[0]
    #  @location1 = @bird_locations[0]
    #  @location2 = @bird_locations[1]
    #  @location2 = @bird_locations[1]
    #  @location3 = @bird_locations[2]
    #  @location3 = @bird_locations[2]
    #  @location4 = @bird_locations[3]
    #  @location4 = @bird_locations[3]
    #  @location5 = @bird_locations[4]
    #  @location5 = @bird_locations[4]
    #end

end
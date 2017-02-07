class UsersController < ApplicationController

  def index
    @rooms = current_user.rooms.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@rooms) do |room, marker|
      marker.lat room.latitude
      marker.lng room.longitude
    end
  end

  private


  def user_params
    params.require(:user).permit(:room_id)
  end
end

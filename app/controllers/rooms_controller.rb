class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]
  before_action :set_room, only: [:show]

  def show
    @room = Room.find(params[:id])

    @hash = Gmaps4rails.build_markers(@room) do |room, marker|
      marker.lat room.latitude
      marker.lng room.longitude
    end
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private


  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:title, :city, :address, :price, :capacity, :user)
  end
end

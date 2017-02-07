class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]
  before_action :set_room, only: [:show]

  def show

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

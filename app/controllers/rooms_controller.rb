class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]
  before_action :set_room, only: [:show]

  def show

  end

  def new
    @room = Room.new
  end

  def create

  end

  private


  def set_room
    @room = Room.find(params[:id])
  end

end

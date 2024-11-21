class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :own,]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
    @user = current_user
  end

  def create
    @user = current_user
    @room = Room.new(params.require(:room).permit(:name, :description, :rate, :address, :room_image, :user_id))
    if @room.save
      flash[:notice] = "施設情報を登録しました"
      redirect_to :own_rooms
    else
      flash[:alert] = "施設情報の登録に失敗しました"
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @user = current_user
    @reservation = Reservation.new
  end
  
  def edit
    @room = current_user.rooms.find(params[:id])
  end

  def update
    @room = current_user.rooms.find(params[:id])
    if @room.update(params.require(:room).permit(:name, :description, :rate, :address, :room_image))
      flash[:notice] =  "施設情報を更新しました"
      redirect_to :own_rooms
    else
      flash[:alert] = "施設情報の登録に失敗しました"
      render "edit"
    end
  end

  def destroy
    @room = current_user.rooms.find(params[:id])
    @room.destroy
    flash[:notice] = "施設を削除しました"
    redirect_to :own_rooms
  end

  def own
    @user = current_user
    @room = Room.new
    @rooms = @user.rooms
  end
end

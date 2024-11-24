class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :confirm, :update]

  def index
    @user = current_user
    @reservation = Reservation.new
    @reservations = @user.reservations
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @user = current_user
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.invalid?
      flash[:alert] = "予約情報が不足しています"
      render "rooms/show" 
    end
  end

  def create
    @reservation =  current_user.reservations.new(reservation_params)
    @user = current_user
    @room = Room.find(params[:reservation][:room_id])
    if params[:back]
      render "rooms/show"
    elsif  @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to reservations_path
    else
      flash[:alert] = "予約に失敗しました"
      render "rooms/show"
    end
  end

  def edit
    @reservation = current_user.reservations.find(params[:id])
  end

  def update
    @reservation = current_user.reservations.find(params[:id])
    if @reservation.update(params.require(:reservation).permit(:check_in_date, :check_out_date, :count))
      flash[:notice] =  "予約を更新しました"
      redirect_to reservations_path
    else
      flash[:alert] = "再予約に失敗しました"
      render "edit"
    end
  end

  def destroy
    @reservation = current_user.reservations.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約を削除しました"
    redirect_to request.referer
  end

  def modal
    @user = current_user
    @reservation = Reservation.find(params[:reservation_id])
    @room = Room.find(params[:room_id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :check_in_date, :check_out_date, :count, :room_id,
    ).merge(user_id: current_user.id)
  end
end

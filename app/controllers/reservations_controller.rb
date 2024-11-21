class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservation = Reservation.new
    @reservations = @user.reservations
  end

  def new
    @reservation = Reservation.new
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @user = current_user
    @stay_days = (@reservation.check_out_date - @reservation.check_in_date).to_i
    @hotel_bill = (@reservation.room.rate * @reservation.count * @stay_days)
  end

  def create
    @reservation =  current_user.reservations.new(reservation_params)
    @user = current_user
    if  @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to reservations_path
    else
      flash[:alert] = "予約に失敗しました"
      render "confirm"
    end
  end

  def show
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
  private

  def reservation_params
    params.require(:reservation).permit(
      :check_in_date, :check_out_date, :count, :user_id, :room_id,
    )
  end
end

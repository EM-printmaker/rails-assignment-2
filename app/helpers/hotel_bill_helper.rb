module HotelBillHelper
  def hotel_bill(reservation)
      @reservation = reservation
      @reservation.room.rate * @reservation.count * (@reservation.check_out_date - @reservation.check_in_date).to_i
  end
  
  def stay_days(reservation)
    @reservation = reservation
    (@reservation.check_out_date - @reservation.check_in_date).to_i
  end
end

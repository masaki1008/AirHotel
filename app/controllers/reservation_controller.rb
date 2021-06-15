class ReservationController < ApplicationController
  def index
    @reservations = Reservation.all
  end
  
  def new
    @reservation = Reservation.new
  end
  
  def create
    @reservation = current_user.reservations.new(params.require(:reservation).permit(:room_name, :address, :description, :image))
    #以下のsaveメソッドで保存がされません
    if @reservation.save
      flash[:notice] = "予約しました"
      redirect_to :reservations
    else
      #こちらの処理が実行されます。
      flash[:alert] = "予約出来ませんでした..."
      render "new"
    end
  end
end

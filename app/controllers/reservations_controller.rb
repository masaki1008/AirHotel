class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end
  
  def new
    @reservation = Reservation.new
  end
  
  def create
    @reservation = current_user.reservations.new(params.require(:reservation).permit(:price, :start_date, :end_date, :people, :total, :room_id))
    if @reservation.save!
      flash[:notice] = "予約情報を確認してください"
      redirect_to @reservation
    else
      #こちらの処理が実行されます。
      flash[:alert] = "予約が出来ませんでした..."
      @room = @reservation.room
      render "rooms/show"
    end
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def destroy
    @reservation = Reservation.find(params[:id])
      @reservation.destroy
      flash[:notice] = "予約をキャンセルしました"
      redirect_to :reservations
  end
  
  protected
  # deviseのpermitted_parameterを追加する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:image] )
  end
end

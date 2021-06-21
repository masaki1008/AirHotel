class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    if
      @rooms = Room.search(params[:search])
    end
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.new(params.require(:room).permit(:room_name, :description, :price, :address, :image))
    #以下のsaveメソッドで保存がされません
    if @room.save
      flash[:notice] = "ルームを保存しました"
      redirect_to :rooms
    else
      #こちらの処理が実行されます。
      flash[:alert] = "新規登録出来ませんでした..."
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @room = Room.find(params[:id])
      @room.destroy
      flash[:notice] = "ルームを削除しました"
      redirect_to :rooms
  end

  protected
  # deviseのpermitted_parameterを追加する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:image] )
  end
end

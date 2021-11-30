class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @travelboard = Travelboard.find(params[:travelboard_id])
  end

  def new
    @travelboard = Travelboard.find(params[:travelboard_id])
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(review_params)
    @travelboard = Travelboard.find(params[:travelboard_id])
    @chatroom.travelboard = @travelboard
    @chatroom.save
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end

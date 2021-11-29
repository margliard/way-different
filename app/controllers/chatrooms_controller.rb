class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @travelboard = Travelboard.find(params[:travelboard_id])
  end
end

class MessagesController < ApplicationController
skip_before_action :verify_authenticity_token

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @travelboard = Travelboard.find(params[:travelboard_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      redirect_to travelboard_path(@travelboard, anchor: "message-#{@message.id}")
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: {message: @message})
      )
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end

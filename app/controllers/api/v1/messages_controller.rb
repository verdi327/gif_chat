class Api::V1::MessagesController < ApplicationController
  respond_to :json, :xml

  def create
    message = Message.new(message_params)
    if message.save
      render json: {message: "success"}
    else
      render json: {message: message.errors.full_message}
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :media_url, :user_id, :conversation_id)
  end
end
class Api::V1::ConversationsController < ApplicationController
  respond_to :json, :xml

  def index
    user = User.find(params[:user_id])
    @conversations = user.conversations
  end

  def create
    conversation = Conversation.create
    users = User.where(email: params[:users])

    if users.size != params[:users].size
      render json: {message: "could not find some or all users with the given emails"} and return
    end

    users.each do |user|
      conversation.users << user
    end

    render json: {message: "success", conversation_id: conversation.id}
  end
end
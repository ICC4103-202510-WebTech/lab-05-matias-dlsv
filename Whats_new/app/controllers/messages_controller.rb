class MessagesController < ApplicationController
    def index
      @messages = Message.all
    end

    def show
      @message = Message.find(params[:id])
    end

    def new
      @message = Message.new
    end

    def create
      @message = Message.new(message_params)
      chat = Chat.find(message_params[:chat_id])
      @message.user_id = chat.sender_id
      if @message.save
        redirect_to messages_path, notice: "Message created successfully."
      else
        render :new
      end
    end

    private

    def message_params
      params.require(:message).permit(:chat_id, :user_id, :body)
    end
  end
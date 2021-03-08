class My::ConversationsController < ApplicationController
  #my/conversations?user_id=42
  def index
    @user = User.find_by(id: params[:user_id]) || first_conversation_user
    @messages = @user.messages_with(current_user)
    @message = Message.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @message = Message.new(message_params)
    @message.user = @user
    @message.user = current_user
    if @message.save 
      redirect_to my_conversations_path(current_user)
    else
      render "my/conversations"
    end
  end

  private 

  def first_conversation_user
    current_user.conversation_users.first
  end

  def message_params
    params.require(:message).permit(:content)
  end
end


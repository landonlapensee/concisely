class My::ConversationsController < ApplicationController
  #my/conversations?user_id=42
  def index
    @user = User.find(params[:user_id])
    @messages = @user.messages_with(current_user)
  end
  
end


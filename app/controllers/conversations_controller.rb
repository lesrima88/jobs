class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = current_user.mailbox.conversations
 end

  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])
  end

  def new
    @user = User.find_by(id: params[:recipient_id])
  end
  


  
  def create
    recipients = User.find_by(id: params[:recipient_id])
    conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
  
    redirect_to conversation_path(conversation)
  end
  
  private

  def conversation_params
    params.require(:conversation).permit(:subject, :body,recipients:[])
  end
  
end
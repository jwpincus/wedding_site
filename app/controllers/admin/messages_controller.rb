class Admin::MessagesController < AdminController
  before_action :is_admin
  
  def new
    @message = Message.new
  end
  
  def show
    @message = Message.find(params[:id])
    if params[:preview]
      response = MessageMailer.send_message(@message, Guest.new(email: current_user.email, name: current_user.name)).deliver_now
    end
  end
  
  def create
    message = Message.create(message_params)
    redirect_to admin_message_path(message)
  end
  
  
  private
  
  def message_params
    params.require(:message).permit(:body, :subject)
  end
  
end

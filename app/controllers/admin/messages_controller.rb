class Admin::MessagesController < AdminController
  before_action :is_admin
  
  def new
    @message = Message.new
  end
  
  def create
    Message.create(message_params)
    redirect_to dashboard_path
  end
  
  private
  
  def message_params
    params.require(:message).permit(:body, :subject)
  end
  
end

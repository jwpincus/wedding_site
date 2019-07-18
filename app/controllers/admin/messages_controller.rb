class Admin::MessagesController < AdminController
  before_action :is_admin

  def new
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
    if params[:preview]
      MessageMailer.send_message(@message, Guest.new(email: current_user.email, first_name: current_user.name)).deliver_now
    elsif params[:send_all]
      Guest.where.not(email: '', will_attend: 'not attending').each do |guest|
        MessageMailer.send_message(@message, guest).deliver_later!
      end
    end
  end

  def create
    message = Message.create(message_params)
    redirect_to admin_message_path(message)
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    message = Message.update(message_params)
    redirect_to admin_message_path(message)
  end

  private

  def message_params
    params.require(:message).permit(:body, :subject)
  end

end

 class TicketsController < ApplicationController

  def index
    @tickets = Ticket.order(:title)
  end

  def new
    @ticket = Ticket.new  
  end

  def create
    @ticket = Ticket.new ticket_params
    @ticket.user = current_user
    if @ticket.save 
      redirect_to tickets_path
    else 
      flash[:alert] = "Ticket was not created!"
      render :new
    end

  end

  def destroy
    @ticket.destroy
    redirect_to root_path, notice: "Ticket deleted!"
  end

  private

  def ticket_params
    params.require(:tickets).permit(:title, :description)
  end

end

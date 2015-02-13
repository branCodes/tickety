class TicketsController < ApplicationController

  # def index
  # end

  def new
    @ticket = Ticket.new  
  end

  def create
    @ticket = Ticket.new ticket_params
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

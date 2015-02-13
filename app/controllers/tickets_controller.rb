 class TicketsController < ApplicationController

  def index
    @tickets = Ticket.order(:title)
  end

  def new
    @ticket = Ticket.new  
  end

  def create
    @ticket = Ticket.new ticket_params
    #@ticket.user = current_user
    if @ticket.save
      redirect_to tickets_path, notice: "Ticket created!"
    else 
      flash[:alert] = "Ticket was not created!"
      render :new
    end
  end

  def destroy
    @ticket = Ticket.find params[:id]
    @ticket.destroy
    redirect_to root_path, notice: "Ticket deleted!"
  end

  def show
    @ticket = Ticket.find params[:id]
  end

  def edit
    @ticket = Ticket.find params[:id]
  end

  def update
    @ticket = Ticket.find params[:id]
    if @ticket.update ticket_params
      redirect_to @ticket, notice: "Ticket updated"
    else
      flash[:alert] = "Ticket didn't update"
      render :edit
    end 
  end

   # def toggle_status
   #  @ticket = Ticket.find params[:id]
   #  if @ticket.status == false && @task.user != current_user
   #    TaskMailer.delay.notify_task_owner(@task)
   #    @task.status = true
   #  elsif @task.status == false
   #    @task.status = true
   #  elsif @task.status == true
   #    @task.status = false
   #  end
   #  @task.save
   #  respond_with ()
   #  #redirect_to project_path(@task.project_id)
  # end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description)
  end

end

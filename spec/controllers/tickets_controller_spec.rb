require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  
  describe "#index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "#new" do
    it "renders a new template" do
      get :new
      expect(response).to render_template(:new)
    end
    
    it "assigns a new ticket instance" do
      get :new
      expect(assigns(:ticket)).to be_a_new(Ticket)
    end
  end

  describe "#create" do
    it ""
  end

end

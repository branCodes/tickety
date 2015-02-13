require 'rails_helper'
require 'spec_helper'

RSpec.describe TicketsController, type: :controller do
  let(:user) { create(:user) }
  let(:ticket) { create(:ticket) }
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
  
        context "with valid parameters" do
          def valid_request
            post :create, {ticket: {
                              title: "valid campaign title",
                              description: "valid descritpion"
                          }}
          end

          it "adds a ticket to the database for current user" do
            expect { valid_request }.to change { Ticket.count }.by(1)
          end

          it "redirect to ticket index" do
            valid_request
            expect(response).to redirect_to tickets_path
          end

          it "sets a flash message" do
            valid_request
            expect(flash[:notice]).to be
          end
        end

        context "with invalid parameters" do
          def invalid_request
            post :create, {ticket: {
                              title: "lol",
                              description: nil
                          }}
          end

          it "doesnt create a record in the database" do
            expect { invalid_request }.to change { Ticket.count }.by(0)
          end

          it "renders the new template" do
            invalid_request
            expect(response).to render_template(:new)
          end

          it "sets a flash message" do
            invalid_request
            expect(flash[:alert]).to be
          end
        end
    
    end

    describe "#destroy" do
      it "deletes the ticket from the database" do
        expect { delete :destroy, id: ticket.id }.to change { Ticket.count }.by(-1)
      end
    end

    describe "#show" do
      it "renders the show template" do
        get :show, id: ticket.id
        expect(response).to render_template(:show)
      end
    end

    describe "#edit" do
      before do
        get :edit, id: ticket.id
      end
      it "renders the edit template" do
        expect(response).to render_template(:edit)
      end
    end
end


































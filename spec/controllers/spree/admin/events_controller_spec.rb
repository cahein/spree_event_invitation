require 'rails_helper'
module Spree
  module Admin
    describe EventsController do
      before {
        controller.stub spree_current_user: User.new
      }
      stub_authorization!

      include Spree::TestingSupport::ControllerRequests

      it "should respond successfully" do
        spree_get :index
        expect(response).to be_success
        expect(response).to render_template("index")
        expect(response.status).to eq(200)

        spree_get :new
        expect(response).to be_success
        expect(response.status).to eq(200)
        expect(response).to render_template("edit")
      end

      it "should respond to model_class as Spree::Event" do
        spree_get :new
        controller.send(:model_class).should eql(Spree::Event)
      end

      it "should respond with a list of events" do
        # FactoryGirl
        location1 = create(:location1)
        event1 = create(:event1)
        event2 = create(:event2)
        f_events = Spree::Event.all

        spree_get :index
        expect(assigns(:events)).to match_array(f_events)
      end

      it "should respond with edit event page" do
        event1 = create(:event1)
        params = Hash.new
        params[:id] = '1'

        spree_get :edit, params
        response.should render_template :edit
        expect(assigns(:event)).to match(event1)
      end

      it "should fail to create a new event" do
        params = Hash.new
        params['event'] = {
          title: 'Veranstaltung 4',
          date: '2015-02-01'
        }
        expect{
          spree_get :create, params
        }.to_not change(Spree::Event, :count)
        response.should render_template :edit
      end

      it "should delete an event" do
        event = create(:event1)
        expect{
          spree_get :destroy, id: event
        }.to change(Spree::Event,:count).by(-1)
      end
    end
  end
end

require 'rails_helper'
module Spree
  module Admin
    describe EventsController do
      before {
        controller.stub spree_current_user: FactoryBot.create(:user, email: "spree@example.com", password: "spree123")
        @location1 = create(:eventlocation, name: 'TuP Verlag', address1: 'Some St 0', zipcode: '12345', city: 'Some City')

      }
      stub_authorization!

      include Spree::TestingSupport::ControllerRequests

      it "should respond successfully" do
        spree_get :index
        expect(response).to be_successful
        expect(response).to render_template("index")
        expect(response.status).to eq(200)

        spree_get :new
        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(response).to render_template("edit")
      end

      it "should respond to model_class as Spree::Event" do
        spree_get :new
        controller.send(:model_class).should eql(Spree::Event)
      end

      it "should respond with a list of events" do
        # FactoryBot
        event1 = create(:event, title:'Veranstaltung 1', date:'2019-05-15', 'begin':'19:00', event_location_id: @location1.id)
        event2 = create(:event, title:'Veranstaltung 2', speaker:'Karam Khella', date:'2019-06-20', 'begin':'19:30', event_location_id: @location1.id)
        f_events = Spree::Event.all

        spree_get :index
        expect(assigns(:events)).to match_array(f_events)
      end

      it "should respond with edit event page" do
        event1 = create(:event, 'title':'Veranstaltung 1', 'date':'2019-05-15', 'begin':'19:00', event_location_id: @location1.id)
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
        event = create(:event, 'title':'Veranstaltung 1', 'date':'2019-05-15', 'begin':'19:00', event_location_id: @location1.id)
        expect{
          spree_get :destroy, id: event
        }.to change(Spree::Event,:count).by(-1)
      end
    end
  end
end

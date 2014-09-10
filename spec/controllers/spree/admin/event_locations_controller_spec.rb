require 'rails_helper'

module Spree
  module Admin
    describe EventLocationsController do
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

      it "should respond to model_class as Spree::EventLocation" do
        spree_get :new
        controller.send(:model_class).should eql(Spree::EventLocation)
      end

      it "should respond with a list of event locations" do
        # FactoryGirl
        location1 = create(:location1)
        location2 = create(:location2)
        f_locations = Spree::EventLocation.all

        spree_get :index
        expect(assigns(:event_locations)).to match_array(f_locations)
      end

      it "should create a new event location" do
        params = Hash.new
        params['event_location'] = {
          name: 'Event Location 3',
          address1: 'Some St 3',
          zipcode: '13579',
          city: 'New City'
        }
        expect{
          spree_get :create, params
        }.to change(Spree::EventLocation, :count).by(1)
        response.should render_template :index
      end

      it "should fail to create a new event location" do
        params = Hash.new
        params['event_location'] = {
          name: 'Event Location 4',
          address1: 'Some St 4',
        }
        expect{
          spree_get :create, params
        }.to_not change(Spree::EventLocation, :count)
        response.should render_template :edit
      end

      it "should delete an event location" do
        event_location = create(:location1)
        expect{
          spree_get :destroy, id: event_location
        }.to change(Spree::EventLocation,:count).by(-1)
      end
    end
  end
end

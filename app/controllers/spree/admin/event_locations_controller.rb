module Spree
  module Admin
    class EventLocationsController < Spree::Admin::ResourceController
      def index
        @event_locations = Spree::EventLocation.all.order("name DESC")
        render :index
      end

      def new
        @event_location = Spree::EventLocation.new
        render :edit
      end

      def edit
        @@logger.info('edit event location: ' + params[:id])
        @event_location = Spree::EventLocation.find(params[:id])
        render :edit
      end

      def create
        params = event_location_params

        event_location = nil
        if (params['id'])
          event_location = Spree::EventLocation.find(params['id'])
          if event_location.update_attributes(params)
            @@logger.info('going to update event location: ' + params['id'])
          else
            flash[:warn] =  "Nothing to update"
            redirect_to action: :index
          end
        else
          @@logger.info('new event location')
          event_location = Spree::EventLocation.new(params)
        end

        if event_location.valid?
          if event_location.save
            flash[:notice] =  Spree.t("event_invitation.event_location_successfully_updated")
            @event_locations = Spree::EventLocation.all.order("name DESC")
            render :index
          end
        else
          @@logger.info('event location not valid')
          @event_location = event_location
          render :edit
        end
      end

      private
      def event_location_params
        params.require(:event_location).permit(:id, :name, :address1, :address2, :phone, :zipcode, :city)
      end
    end
  end
end

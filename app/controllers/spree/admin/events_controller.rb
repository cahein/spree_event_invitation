module Spree
  module Admin
    class EventsController < Spree::Admin::ResourceController
      def index
        @events = Spree::Event.all.order("date DESC")
        render :index
      end

      def new
        @event = Spree::Event.new
        @event.date = Date.today
        @event.begin = '19:00'
        render :edit
      end

      def edit
        @@logger.info('edit event: ' + params[:id])
        @event = Spree::Event.find(params[:id])
        render :edit
      end

      def create
        params = event_params

        event = nil
        if (params['id'])
          event = Spree::Event.find(params['id'])
          if event.update_attributes(params)
            @@logger.info('going to update event: ' + params['id'])
          else
            flash[:warn] =  "Nothing to update"
            redirect_to action: :index
          end
        else
          @@logger.info('new event')
          event = Spree::Event.new(params)
        end

        if event.valid?
          if event.save
            flash[:notice] =  "Veranstaltung erfolgreich aktualisiert"
            @events = Spree::Event.all.order("date DESC")
            render :index
          end
        else
          @@logger.info('event not valid')
          @event = event
          render :edit
        end
      end

      private
      def event_params
        params.require(:event).permit(:id, :title, :subtitle, :body, :date, :begin, :end)
      end
    end
  end
end

module Spree
  class Event < ActiveRecord::Base
    include ActiveModel::ForbiddenAttributesProtection
    validates_presence_of [:title, :date, :begin, :event_location_id]

    belongs_to :event_location, foreign_key: :event_location_id, class_name: 'Spree::EventLocation'
  end
end

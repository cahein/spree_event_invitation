class Spree::Event < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  validates_presence_of [:title, :date, :begin, :event_location_id]

  belongs_to :spree_event_location, :class_name => 'Spree::EventLocation', :foreign_key => 'event_location_id'
end

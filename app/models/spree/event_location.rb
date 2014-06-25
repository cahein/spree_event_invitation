class Spree::EventLocation < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  validates_presence_of [:name, :address1, :zipcode, :city]
end

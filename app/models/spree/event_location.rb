module Spree
  class EventLocation < ApplicationRecord
    include ActiveModel::ForbiddenAttributesProtection
    validates_presence_of [:name, :address1, :zipcode, :city]
  end
end

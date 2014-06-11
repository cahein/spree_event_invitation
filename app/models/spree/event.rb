class Spree::Event < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  validates_presence_of [:title, :date, :begin]
end

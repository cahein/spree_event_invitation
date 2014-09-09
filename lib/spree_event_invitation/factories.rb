FactoryGirl.define do
  factory :location1, class: Spree::EventLocation do |l|
    l.name "TuP Verlag"
    l.address1 "Some St 0"
    l.zipcode "12345"
    l.city "Some City"
  end

  factory :location2, class: Spree::EventLocation do |l|
    l.name "Name of Location"
    l.address1 "Some St 1"
    l.zipcode "67890"
    l.city "Other City"
  end

  factory :event1, class: Spree::Event do |e|
    e.title "Veranstaltung 1"
    e.date "2014-05-15"
    e.begin "19:00"
    association :event_location, factory: :location1
  end

  factory :event2, class: Spree::Event do |e|
    e.title "Veranstaltung 2"
    e.speaker "Karam Khella"
    e.body "Something important to say"
    e.date "2014-06-20"
    e.begin "19:30"
    association :event_location, factory: :location1
  end
end

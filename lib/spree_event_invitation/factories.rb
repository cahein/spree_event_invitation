FactoryGirl.define do
  factory :event1, class: Spree::Event do |e|
    e.title "Veranstaltung 1"
    e.date "2014-05-15"
    e.begin "19:00"
  end
  factory :event2, class: Spree::Event do |e|
    e.title "Veranstaltung 2"
    e.subtitle "im TuP-Verlag"
    e.body "Karam mal wieder"
    e.date "2014-06-20"
    e.begin "19:30"
  end
end

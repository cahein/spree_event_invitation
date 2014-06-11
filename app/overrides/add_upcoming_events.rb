Deface::Override.new(:virtual_path => "spree/home/index",
                     :insert_before => '[data-hook="homepage_products"]',
                     :template => "spree/events/list",
                     :name => "events_list",
                     :disabled => false)

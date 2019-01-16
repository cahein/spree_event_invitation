Deface::Override.new(:virtual_path => "spree/home/index",
                     :original => '586d5fe946fc87947ebda3763bc38007d5692b3e',
                     :insert_before => '[data-hook="homepage_products"]',
                     :template => "spree/events/list",
                     :name => "events_list",
                     :disabled => false)

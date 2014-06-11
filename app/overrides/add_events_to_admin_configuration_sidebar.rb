Deface::Override.new(virtual_path: "spree/admin/shared/_configuration_menu",
                     name: "events_admin_configurations_menu",
                     original: '8d11c65b8393dc0aa962817d6edbbcce7f1e0c31',
                     insert_bottom: "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
                     text: "<%= configurations_sidebar_menu_item 'Veranstaltungen', '/admin/events/' %>",
                     disabled: false)

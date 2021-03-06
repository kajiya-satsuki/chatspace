require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Chatspace
  class Application < Rails::Application
    config.load_defaults 5.1

    config.generators do |g|
      g.javascripts false
      g.helper false
      g.test_framework false

    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'

    config.action_view.automatically_disable_submit_tag = false
    end

  end
end

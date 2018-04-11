require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module ProDobro
  class Application < Rails::Application
    config.load_defaults 5.1
    config.i18n.available_locales = %i[en uk]
    config.i18n.default_locale = :en
  end
end

require_relative "boot"

# require "rails/all"

  require "active_record/railtie"
  require "action_controller/railtie"
  require "action_view/railtie"
  require "action_mailer/railtie"
  require "active_job/railtie"
  require "action_cable/engine"
  require "active_storage/engine"
  require "rails/test_unit/railtie"
  require "sprockets/railtie"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NaganoCake
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.time_zone = 'Asia/Tokyo'
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
  end
end

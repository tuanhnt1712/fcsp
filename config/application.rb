require_relative "boot"
require "rails/all"
require "roo"

Bundler.require(*Rails.groups)

module Fcsp
  class Application < Rails::Application
    config.assets.paths << Rails.root.join("app", "assets", "videos")
    config.rack_mini_profiler_environments = %w(development)
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**",
      "*.{rb,yml}")]
    config.eager_load_paths << Rails.root.join("lib", "support")
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:en, :vi, :jp]
    config.i18n.load_path += Dir[Rails.root.join("config",
      "locales", "**", "*.{rb,yml}")]
    config.autoload_paths += Dir["#{config.root}/app/view_objects/**/"]
    config.time_zone = "Bangkok"
  end
end

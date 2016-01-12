require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Walter
  class Application < Rails::Application
    config.generators do |g|
      g.orm :active_record
      g.test_framework :rspec, :fixure => false
      g.stylesheets false
      g.helpers false
    end

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Sidekiq can be accessed at /sidekiq
    config.active_job.queue_adapter = :sidekiq

    config.action_mailer.default_url_options = { host: Rails.application.secrets.app_domain }
  end
end

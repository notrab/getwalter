require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = { url: "#{Rails.application.secrets.redis_url}"}
end

Sidekiq.configure_client do |config|
  config.redis = { url: "#{Rails.application.secrets.redis_url}"}
end

module Sidekiq
  module Logging
    class Pretty
      def call(severity, time, program_name, message)
        # heroku doesn't need timestamp and process id, strip em out!
        "TID-#{Thread.current.object_id.to_s(36)}#{context} #{severity}: #{message}\n"
      end
    end
  end
end

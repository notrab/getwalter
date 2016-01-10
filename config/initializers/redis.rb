if ENV["REDIS_TO_GO"]
  uri = URI.parse(Rails.application.secrets.redis_url)
  REDIS = Redis.new(
    host: uri.host,
    port: uri.port,
    password: uri.password
  )
end

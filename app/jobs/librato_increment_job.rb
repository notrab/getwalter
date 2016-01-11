class LibratoIncrementJob < ActiveJob::Base
  queue_as :default

  def perform(user, event)
    return unless Rails.env.production?
    Librato.increment event, source: user.id
  end
end

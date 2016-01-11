class MixpanelIncrementJob < ActiveJob::Base
  queue_as :default

  def perform(distinct_id, attributes)
    return unless Rails.application.secrets.mixpanel_token
    tracker = Mixpanel::Tracker.new(Rails.application.secrets.mixpanel_token)
    tracker.people.increment(distinct_id, attributes)
  end
end

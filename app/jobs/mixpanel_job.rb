class MixpanelJob < ActiveJob::Base
  queue_as :default

  def perform(distinct_id, event, attributes)
    return unless Rails.application.secrets.mixpanel_token
    tracker = Mixpanel::Tracker.new(Rails.application.secrets.mixpanel_token)
    tracker.track(distinct_id, event, attributes)
  end
end

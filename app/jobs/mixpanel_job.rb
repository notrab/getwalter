class MixpanelJob < ActiveJob::Base
  queue_as :default

  def perform(user_id, event, attributes)
    return unless Rails.application.secrets.mixpanel_token
    tracker = Mixpanel::Tracker.new(Rails.application.secrets.mixpanel_token)
    tracker.track(user_id, event, attributes)
  end
end

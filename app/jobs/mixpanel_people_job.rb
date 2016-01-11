class MixpanelPeopleJob < ActiveJob::Base
  queue_as :default

  def perform(distinct_id, attributes)
    return unless Rails.application.secrets.mixpanel_token
    tracker = Mixpanel::Tracker.new(Rails.application.secrets.mixpanel_token)
    tracker.people.set(distinct_id, attributes)
  end
end

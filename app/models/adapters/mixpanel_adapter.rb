module Adapters
  class MixpanelAdapter
    def write(user_id, event, attributes = {})
      MixpanelJob.perform_later(user_id, event, attributes) if user_id.present?
    end
  end
end

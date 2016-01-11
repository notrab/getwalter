module Adapters
  class MixpanelAdapter
    def write(distinct_id, event, attributes = {})
      MixpanelJob.perform_later(distinct_id, event, attributes) if distinct_id.present?
    end

    def people(distinct_id, attributes = {})
      MixpanelPeopleJob.perform_later(distinct_id, attributes) if distinct_id.present?
    end

    def increment(distinct_id, attributes = {})
      MixpanelIncrementJob.perform_later(distinct_id, attributes) if distinct_id.present?
    end
  end
end

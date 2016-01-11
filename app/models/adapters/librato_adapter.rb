module Adapters
  class LibratoAdapter
    def increment(user, event)
      LibratoIncrementJob.perform_later(user, event) if user.present?
    end
  end
end

class SessionsController < Clearance::SessionsController
  private

  def url_after_create
    Adapters::MixpanelAdapter.new.increment(current_user.id, {
      'Login Count' => 1
    })

    super
  end
end

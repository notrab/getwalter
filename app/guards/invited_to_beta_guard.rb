class InvitedToBetaGuard < Clearance::SignInGuard
  def call
    if beta_user?
      failure("You must be part of the beta to sign in.")
    else
      next_guard
    end
  end

  def beta_user?
    signed_in? && current_user.beta_access
  end
end

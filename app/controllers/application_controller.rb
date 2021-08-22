class ApplicationController < ActionController::Base
  include Pundit

  before_action :set_paper_trail_whodunnit
  # after_action :verify_authorized
  # after_action :verify_policy_scoped

  private

  def pundit_user
    current_user
  end

  def user_for_paper_trail
    return unless current_user

    current_user.to_gid.to_s
  end

  def info_for_paper_trail
    {
      event_source: [request.method, request.path].join(" ")
    }
  end
end

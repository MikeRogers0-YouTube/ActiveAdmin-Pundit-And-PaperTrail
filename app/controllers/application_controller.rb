class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit

  private

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

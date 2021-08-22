class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError

  before_perform :set_info_for_paper_trail

  private

  def set_info_for_paper_trail
    ::PaperTrail.request.controller_info = {
      event_source: self.class.name
    }
  end
end

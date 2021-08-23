class ApplicationForm
  class FormNotSaved < ActiveRecord::RecordNotSaved
  end

  include ActiveModel::Model

  def save!
    save || raise(FormNotSaved.new("Failed to save the form", self))
  end
end

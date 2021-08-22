module PaperTrail
  class Version < ActiveRecord::Base
    include PaperTrail::VersionConcern

    def gid_whodunnit
      GlobalID::Locator.locate(whodunnit) || "System"
    end
  end
end

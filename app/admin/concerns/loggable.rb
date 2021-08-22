module ActiveAdmin::Loggable
   def self.extended(base)
    base.instance_eval do
      action_item :history, only: :show do
        link_to('History', [:history, :admin, resource])
      end

      sidebar :history, only: [:show] do
        ul do
          resource.versions.reorder(created_at: :desc).each do |version|
            li [
              version.gid_whodunnit,
              version.created_at
            ].join(" - ")
          end
        end
      end

      member_action :history do
        render "versions"
      end
    end
   end
end

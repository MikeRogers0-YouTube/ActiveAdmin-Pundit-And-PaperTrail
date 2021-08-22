module ActiveAdmin
  module Versions

    # Adds #active_admin_versions to the show page for use
    # and sets it up on the default main content
    module ShowPageHelper

      # Add admin comments to the main content if they are
      # turned on for the current resource
      def default_main_content
        super
        active_admin_versions # if resource.versions
      end

      # Display the comments for the resource. Same as calling
      # #active_admin_versions with the current resource
      def active_admin_versions(*args, &block)
        active_admin_versions_for(resource, *args, &block)
      end
    end

  end
end

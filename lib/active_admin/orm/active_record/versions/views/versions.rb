require "active_admin/views"
require "active_admin/views/components/panel"

module ActiveAdmin
  module Versions
    module Views

      class Versions < ActiveAdmin::Views::Panel
        builder_method :active_admin_versions_for

        attr_accessor :resource

        def build(resource)
          if authorized?(ActiveAdmin::Auth::READ, PaperTrail::Version)
            @resource = resource
            @versions = active_admin_authorization.scope_collection(resource.versions.page(params[:page]))
            super(title, for: resource)
            build_versions
          end
        end

        protected

        def title
          I18n.t "active_admin.versions.title_content", count: @versions.count
        end

        def build_versions
          if @versions.any?
            @versions.each(&method(:build_version))
            div page_entries_info(@versions).html_safe, class: "pagination_information"
          else
            build_empty_message
          end

          text_node paginate @versions
        end

        def build_version(version)
          div for: version do
            div class: "active_admin_version_meta" do
              h4 class: "active_admin_version_author" do
                version.whodidit ? auto_link(version.whodidit) : I18n.t("active_admin.versions.author_missing")
              end
              span pretty_format version.created_at
            end
            div class: "active_admin_version_body" do
              simple_format version.changes
            end
          end
        end

        def build_empty_message
          span I18n.t("active_admin.versions.no_versions_yet"), class: "empty"
        end
      end
    end
  end
end

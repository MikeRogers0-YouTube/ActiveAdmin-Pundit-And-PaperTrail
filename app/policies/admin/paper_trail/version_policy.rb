class Admin::PaperTrail::VersionPolicy < ApplicationPolicy
  def index?
    user.role_project_manager? || user.role_developer?
  end

  def create?
    user.role_project_manager? || user.role_developer?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

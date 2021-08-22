class ActiveAdmin::PagePolicy < ApplicationPolicy
  def show?
    user.role_project_manager? || user.role_developer?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

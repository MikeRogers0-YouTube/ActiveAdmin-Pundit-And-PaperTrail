class Admin::PostPolicy < ApplicationPolicy
  def index?
    user.role_project_manager? || user.role_developer?
  end

  def show?
    user.role_project_manager? || user.role_developer?
  end

  def create?
    user.role_project_manager? || user.role_developer?
  end

  def update?
    user.role_project_manager? || user.role_developer?
  end

  def destroy?
    false
  end

  def history?
    user.role_project_manager? || user.role_developer?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

class Admin::Post::PublishFormPolicy < ApplicationPolicy
  def index?
    user.role_project_manager? || user.role_developer?
  end

  def create?
    !record.published? && (user.role_project_manager? || user.role_developer?)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

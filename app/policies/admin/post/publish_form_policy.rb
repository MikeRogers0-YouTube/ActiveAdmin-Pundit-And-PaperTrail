class Admin::Post::PublishFormPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    !record.published?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

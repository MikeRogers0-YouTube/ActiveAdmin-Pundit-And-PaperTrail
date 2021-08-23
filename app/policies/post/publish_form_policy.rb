class Post::PublishFormPolicy < ApplicationPolicy
  def create?
    !record.published?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

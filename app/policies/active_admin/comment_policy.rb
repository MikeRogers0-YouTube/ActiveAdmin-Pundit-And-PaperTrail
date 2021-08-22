class ActiveAdmin::CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

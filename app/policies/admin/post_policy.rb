class Admin::PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    false
  end

  def history?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

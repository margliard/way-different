class FavoritePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def changeday?
    true
  end

  def create?
    true
  end
end

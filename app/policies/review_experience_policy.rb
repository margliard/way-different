class ReviewExperiencePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
  end

  def create?
    true
  end

  def destroy?
    user == record.user #|| user.admin
  end
end

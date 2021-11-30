class TravelboardPolicy < ApplicationPolicy
  class Scope < Scope
    # index
    def resolve
      scope.all
      # scope.where(user: user)
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    false
  end

  def create?
    false
  end

  # CAN BE EMPTY AS EDIT IS TAKING UPDATE VALUE ACCORDING TO APPLICATION_POLICY
  def edit?
  end

  def update?
    user == record.user || user.admin
  end

  def destroy_all
    user == record.user || user.admin
  end

end

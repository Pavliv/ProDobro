class UserPolicy < ApplicationPolicy
  # class Scope < Scope
  #    def initialize(user, scope)
  #     @user  = user
  #     @scope = scope
  #   end
  #   def resolve
  #     scope
  #   end
  # end
  def index?
    user.has_role? :admin
  end

  def show?
    user.has_role? :admin
  end

  def new?
    user.has_role? :admin
  end

  def edit?
    user.has_role? :admin
  end

  def create?
    user.has_role? :admin
  end

  def update?
    user.has_role? :admin
  end

  def destroy?
    user.has_role? :admin
  end
end

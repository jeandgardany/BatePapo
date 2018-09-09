class SalaPolicy < ApplicationPolicy
  class Scope < Scope
  	#if user.admin?
    #  scope.all
    #else
    #  scope.where(user: user)
    #end
    def resolve
      scope.all
    end
  end

  attr_reader :user, :sala

  def initialize(user, sala)
    @user = user
    @sala = sala
  end

  def new?
    user.admin?
  end
  
  def create?
    user.present?
  end
 
  def show?
    @user
  end
 
  def edit?
   	true
  end
 
  def update?
    true
  end
 
  def destroy?
    true
  end
end

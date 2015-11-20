class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    if user
        can :create, :all
        can [:update, :destroy], :all, :user => user
        if user.admin
            can :manage, :all #:all
        end
    end
  end
end

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    if user
        can :create, :all
        can [:update, :destroy], :all, :user => user # NHO: currently I do not think this will work because there is no user_id on teams, or players
        # how could we implement a rule that fits our current domain?
        if user.admin
            can :manage, :all #:all #NHO: make sure to remove unused/commented out code
        end
    end
  end
end

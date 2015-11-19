class Ability
  include CanCan::Ability

  def initialize(user)
            can :read, :all
            if user
                can :create, :all
                if user.admin
                    can :manage, :all #:all
                end
            end

            can [:update, :destroy], :all, :user => user #do |article|
              #  article.user == user
            #end
  end
end

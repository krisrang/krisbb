class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :index, :show, :bb, to: :read
    can :create, User

    if user && user.admin
      can :manage, :all
    elsif user
      can :create, Message
      can :read, Message
      can :read, User

      can :manage, Message, user_id: user.id
      can :manage, User, _id: user.id
    end
  end
end

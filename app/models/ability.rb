class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Club, Post]

    if !user.nil?
      can :manage, Club, user: user
      can :manage, Comment, user: user
    end
  end
end
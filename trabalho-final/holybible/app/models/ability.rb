# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.kind == 'normal'
        can :access, :rails_admin
        can :manage, :dashboard
        can :manage, Ministry, user_id: user.id
        can :manage, Church, user_id: user.id
        can :read, Verse
        can :read, User, id: user.id
      elsif user.kind == 'manager'
        can :manage, :all
      end
    end
  end
end
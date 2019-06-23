# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # 全ての権限を剥奪
    cannot :manage, :all

    if user.has_role?(:guest)
      can :read, :all
      cannot :manage, User
    end

    if user.has_role?(:admin)
      can :manage, :all
    end
  end
end

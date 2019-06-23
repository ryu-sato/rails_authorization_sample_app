class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :ldap_authenticatable

  after_create :assign_admin_role
  after_create :assign_default_role

  scope :internals, -> { where(external: false) }
  scope :externals, -> { where(external: true)  }

  def assign_default_role
    self.add_role(:guest) if self.roles.blank?
  end

  def assign_admin_role
    self.add_role(:admin) if self.name == 'admin'
  end

  def ldap_before_save
    self.external = true
    self.add_role(:user)
  end
end

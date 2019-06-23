class User < ApplicationRecord
  rolify
  devise :ldap_authenticatable

  after_create :assign_admin_role
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:guest) if self.roles.blank?
  end

  def assign_admin_role
    self.add_role(:admin) if self.name == 'admin'
  end
end

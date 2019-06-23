require 'devise/strategies/database_authenticatable'

module Devise
  module Strategies
    class CustomDatabaseAuthenticatable < DatabaseAuthenticatable
      def valid?
        true
      end

      # ref: https://github.com/cschiewek/devise_ldap_authenticatable/issues/24#issuecomment-965648
      def authenticate!
        return fail(:invalid) unless valid_for_params_auth?

        # 内部で認証するユーザ一覧に存在すればパスワード認証を行う
        username = params_auth_hash[:name]
        password = params_auth_hash[:password]
        user = User.internals.find_by(name: username)
        if user&.valid_password?(password)
          success!(user)
        else
          fail(:not_found_in_database)
        end
      end
    end
  end
end

Warden::Strategies.add(:custom_database_authenticatable, Devise::Strategies::CustomDatabaseAuthenticatable)

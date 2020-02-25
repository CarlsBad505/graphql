module Mutations
  class CreateUser < BaseMutation
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    argument :name, String, required: true
    argument :auth_provider, AuthProviderSignupData, required: false

    type Types::UserType

    def resolve(name: nil, auth_provider: nil)
      User.create!(
        name: name,
        email: auth_provider&.dig(:credentials, :email),
        password: auth_provider&.dig(:credentials, :password)
      )
    rescue => e
      raise GraphQL::ExecutionError, "Invalid input: #{e.record.errors.full_messages.join(', ')}", caller
    end

    def caller
      puts "Log Error..."
      # Rails.logger the issue as a callback
    end

  end
end

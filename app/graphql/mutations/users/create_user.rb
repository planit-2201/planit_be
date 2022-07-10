module Mutations
  module Users
    class CreateUser < ::Mutations::BaseMutation
      argument :username, String, required: true
      argument :flowrate, Float, required: true

      type Types::UserType

      def resolve(attributes)
        user = User.create(attributes)
      end
    end
  end
end
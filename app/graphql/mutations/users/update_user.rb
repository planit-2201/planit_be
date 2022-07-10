module Mutations
  module Users
    class UpdateUser < ::Mutations::BaseMutation
      argument :id, Integer, required: true
      argument :username, String, required: true
      argument :flowrate, String, required: true
      
      type Types::UserType

      def resolve(attributes)
        user = User.where(id: attributes[:id]).first
        user.update(attributes)
      end
    end
  end
end
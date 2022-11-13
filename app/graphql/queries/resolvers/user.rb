module Queries
  module Resolvers
    class User < GraphQL::Schema::Resolver
      type Types::UserType, null: false # typeはUserType一件
      description "特定Userの取得"

      argument :id, String, required: true, description: "Userのid"

      def resolve(params)
        # ::Userとしているのは、Queries::Resolvers::Userとして呼ばれるのを防ぐ為 (ActiverecordのUserが呼ばれる)
        ::User.find(params[:id])
      end
    end
  end
end

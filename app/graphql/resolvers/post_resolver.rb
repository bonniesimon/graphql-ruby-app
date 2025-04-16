module Resolvers
  class PostResolver < BaseResolver
    type Types::PostType, null: false
    argument :id, ID

    # How do we get the comments in the graphiql
    def resolve(id:)
      handle_view_increment(id)
      post(id)
    end

    private

      def handle_view_increment(id)
        Rails.cache.increment("#{post(id).id}:views")
      end

      def post(id)
        Post.find(id)
      end
  end
end

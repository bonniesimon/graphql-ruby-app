module Resolvers
  class PostResolver < BaseResolver
    type Types::PostType, null: false
    argument :id, ID

    # How do we get the comments in the graphiql
    def resolve(id:)
      ::Post.find(id)
    end
  end
end

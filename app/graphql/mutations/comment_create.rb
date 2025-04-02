# frozen_string_literal: true

module Mutations
  class CommentCreate < BaseMutation
    description "Creates a new comment"

    field :comment, Types::CommentType, null: false

    argument :body, String
    argument :post_id, ID

    def resolve(body:, post_id:)
      post  = Post.find(post_id)
      comment = post.comments.new(body:)
      raise GraphQL::ExecutionError.new "Error creating comment", extensions: comment.errors.to_hash unless comment.save

      { comment: comment }
    end
  end
end

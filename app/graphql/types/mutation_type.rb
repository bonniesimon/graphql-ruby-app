# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :comment_create, mutation: Mutations::CommentCreate
  end
end

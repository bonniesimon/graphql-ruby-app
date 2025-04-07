require "rails_helper"

RSpec.describe Mutations::CommentCreate do
  let!(:post) {create(:post)}
  let(:comment_body) {"Nice Aesthetics"}

  it "creates a new comments" do
    result = GraphqlRailsApiSchema.execute(comment_create_query_string, variables: {input: {body: comment_body, postId: post.id}})

    expected_result = result.dig("data", "commentCreate", "comment")
    expect(expected_result["id"]).to eq("1")
    expect(expected_result["body"]).to eq(comment_body)
    expect(post.comments.count).to eq(1)
  end

  private
    def comment_create_query_string
      <<~GRAPHQL
      mutation createComment($input: CommentCreateInput!) {
        commentCreate(input: $input){
          comment {
            id
            body
          }
        }
      }
      GRAPHQL
    end
end

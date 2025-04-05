require "rails_helper"

RSpec.describe Resolvers::PostResolver do
  context "when post exists" do
    let!(:post) {create(:post)}

    it "resolves post based on id" do
      query_string = <<~GRAPHQL
      {
        post(id: 1) {
          title
          rating
          comments {
            id
          }
        }
      }
      GRAPHQL

      result = GraphqlRailsApiSchema.execute(query_string, variables: {id: 1})

      expected_result = result["data"]["post"]
      expect(expected_result["title"]).to eq(post.title)
      expect(expected_result["rating"]).to eq(post.rating)
      expect(expected_result["comments"]).to eq(post.comments)
    end
  end
end

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

    it "updates view count based on id" do
      allow(Rails.cache).to receive(:increment).and_return(nil)

      expect(Rails.cache).to receive(:increment).with("#{post.id}:views")

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

      GraphqlRailsApiSchema.execute(query_string, variables: {id: 1})
    end
  end
end

require "rails_helper"

RSpec.describe Resolvers::PostsResolver do
    let!(:posts) {create_list(:post, 3)}

    it "lists all posts" do
      query_string = <<~GRAPHQL
      {
        posts {
          title
          rating
        }
      }
      GRAPHQL

      result = GraphqlRailsApiSchema.execute(query_string)

      expected_result = result["data"]["posts"]
      expect(expected_result.size).to eq(3)
    end
end

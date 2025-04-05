FactoryBot.define do
  factory :comment do
    body { "MyText" }
    post { create(:post) }
  end
end

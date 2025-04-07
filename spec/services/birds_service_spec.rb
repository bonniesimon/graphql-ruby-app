require "rails_helper"

RSpec.describe BirdsService, :vcr do
  let(:subject) {BirdsService.new}

  it "gets list of birds" do
    expect(subject.birds.size).to be > 0
  end

  it "gets a list of birds based on limit" do
    expect(subject.birds(limit: 5).size).to be(5)
  end

  it "gets a bird based on id" do
    expect(subject.bird(1).dig("id")).to be(1)
  end
end

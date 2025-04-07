require "rails_helper"

RSpec.describe BirdsService do
  let(:subject) {BirdsService.new}

  it "gets list of birds" do
    expect(subject.birds(limit:5).size).to be(5)
  end
end

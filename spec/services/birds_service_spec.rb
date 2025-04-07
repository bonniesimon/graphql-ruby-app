require "rails_helper"

RSpec.describe BirdsService do
  let(:subject) {BirdsService.new}

  it "gets list of birds" do
    expect(subject.birds.size).to be > 0
  end
end

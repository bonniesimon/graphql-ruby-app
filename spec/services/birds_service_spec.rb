require "rails_helper"

RSpec.describe BirdsService do
  let(:subject) {BirdsService.new}

  it "gets list of birds" do
    expect(subject.birds).to be([])
  end
end

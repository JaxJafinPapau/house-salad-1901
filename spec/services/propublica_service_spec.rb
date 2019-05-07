require 'rails_helper'

describe PropublicaService do
  context "instance methods" do
    it "gets members" do
      service = PropublicaService.new(state: "CO")

      result = service.get_members

      expect(result).to be_a(Hash)
      expect(result).to have_key(:results)
    end
  end
end

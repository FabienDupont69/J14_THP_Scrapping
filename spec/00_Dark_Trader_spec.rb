require_relative '../lib/00_Dark_Trader'

describe "test the realisation of the array" do
    it "should returnhash, and hash is not nil" do
        expect(create_hash).not_to be_nil
        expect(create_hash()).is_a? Array
    end
end
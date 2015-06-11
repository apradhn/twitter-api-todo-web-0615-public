require_relative 'spec_helper'
require 'pry'

describe TwitterApi do
  let(:client) { TwitterApi.new }
  # BE SURE TO ADD YOUR USERNAME INSIDE OF THE STRING BELOW!
  let(:user) { "Lil_Ibuprofen" }

  before(:all) do
    encoded = "cmVxdWlyZSAndHdpdHRlcicKcmVxdWlyZSAneWFtbCcKCmNsYXNzIFNwZWNU\nd2l0dGVyQXBpCiAgYXR0cl9yZWFkZXIgOmNsaWVudAoKICBkZWYgaW5pdGlh\nbGl6ZQogICAga2V5cyA9IFlBTUwubG9hZF9maWxlKCdhcHBsaWNhdGlvbi55\nbWwnKQoKICAgIEBjbGllbnQgPSBUd2l0dGVyOjpSRVNUOjpDbGllbnQubmV3\nIGRvIHxjb25maWd8CiAgICAgIGNvbmZpZy5jb25zdW1lcl9rZXkgICAgICAg\nID0ga2V5c1snQ09OU1VNRVJfS0VZJ10KICAgICAgY29uZmlnLmNvbnN1bWVy\nX3NlY3JldCAgICAgPSBrZXlzWydDT05TVU1FUl9TRUNSRVQnXQogICAgICBj\nb25maWcuYWNjZXNzX3Rva2VuICAgICAgICA9IGtleXNbJ0FDQ0VTU19UT0tF\nTiddCiAgICAgIGNvbmZpZy5hY2Nlc3NfdG9rZW5fc2VjcmV0ID0ga2V5c1sn\nQUNDRVNTX1RPS0VOX1NFQ1JFVCddCiAgICBlbmQKICBlbmQKCiAgZGVmIG1v\nc3RfcmVjZW50X2ZvbGxvd2VyCiAgICBjbGllbnQuZnJpZW5kcy5maXJzdAog\nIGVuZAoKICBkZWYgZmluZF91c2VyX2Zvcih1c2VybmFtZSkKICAgIGNsaWVu\ndC51c2VyKHVzZXJuYW1lKQogIGVuZAoKICBkZWYgZmluZF9mb2xsb3dlcnNf\nZm9yKHVzZXIpCiAgICBjbGllbnQuZm9sbG93ZXJzKHVzZXIpLnRha2UoMTAp\nCiAgZW5kCmVuZAo=\n"
    decoded = Base64.decode64(encoded)
    File.open('./spec/spec_twitter_api.rb', 'w') do |file|
      file.write(decoded)
    end
    require_relative './spec_twitter_api.rb'
  end

  after(:all) do
    File.open('./spec/spec_twitter_api.rb', 'w') do |file|
      file.truncate(0)
    end
  end

  describe '#most_recent_follower' do
    it 'returns the most your most recent Twitter follower' do
      expect(client.most_recent_follower).to eq(SpecTwitterApi.new.most_recent_follower)
    end
  end

  describe "#find_user_for" do
    it 'returns the Twitter user associated with username that you passed in as a parameter' do
      expect( client.find_user_for(user) ).to eq( SpecTwitterApi.new.find_user_for(user) )
    end
  end

  describe "#find_followers_for" do
    it 'returns 10 followers for a specific Twitter user' do
      expect( client.find_followers_for(user) ).to eq( SpecTwitterApi.new.find_followers_for(user) )
    end
  end
end

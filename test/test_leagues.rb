require 'minitest/autorun'
require 'webmock/minitest'
require 'barcher'

class TestLeagues < Minitest::Test
  def setup
    @client = Barcher::Client.new(token: "sample")
    endpoint = Addressable::Template.new("#{Barcher::Client::API_ENDPOINT}/leagues")
    stub_request(:get, endpoint).
      with(:headers => {'Accept'=>'application/json', 'Authorization'=>'Bearer sample'}).
      to_return(:status => 200, :body => "{}", :headers => {})
  end

  def test_leagues
    assert_equal @client.leagues.parsed_response, "{}"
  end

end

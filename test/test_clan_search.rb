require 'minitest/autorun'
require 'webmock/minitest'
require 'barcher'

class TestClanSearch < Minitest::Test
  def setup
    @client = Barcher::Client.new(token: "sample")
    stub_request(:get, "#{Barcher::Client::API_ENDPOINT}/clans").
      with(:headers => {'Accept'=>'application/json', 'Authorization'=>'Bearer sample'}).
      to_return(:status => 200, :body => "{}", :headers => {})
  end

  def test_search_with_no_params
    assert_equal @client.clan_search.parsed_response, "{}"
  end

end

require 'minitest/autorun'
require 'webmock/minitest'
require 'barcher'

class TestFindClan < Minitest::Test
  def setup
    @client = Barcher::Client.new(token: "sample")
    endpoint = Addressable::Template.new("#{Barcher::Client::API_ENDPOINT}/clans/{clan_tag}")
    stub_request(:get, endpoint).
      with(:headers => {'Accept'=>'application/json', 'Authorization'=>'Bearer sample'}).
      to_return(:status => 200, :body => "{}", :headers => {})
  end

  def test_search_with_no_params
    assert_equal @client.find_clan("#123456").parsed_response, "{}"
  end

end

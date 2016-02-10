require 'minitest/autorun'
require 'webmock/minitest'
require 'barcher'

class TestClanMembers < Minitest::Test
  def setup
    @client = Barcher::Client.new(token: "sample")
    endpoint = Addressable::Template.new("#{Barcher::Client::API_ENDPOINT}/clans/{clan_tag}/members")
    stub_request(:get, endpoint).
      with(:headers => {'Accept'=>'application/json', 'Authorization'=>'Bearer sample'}).
      to_return(:status => 200, :body => "{}", :headers => {})
  end

  def test_search_with_no_params
    assert_equal @client.clan_members_for("123456").parsed_response, "{}"
  end

end

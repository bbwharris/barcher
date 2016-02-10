require 'minitest/autorun'
require 'webmock/minitest'
require 'barcher'

class TestLocations < Minitest::Test
  def setup
    @client = Barcher::Client.new(token: "sample")
    locations_endpoint = Addressable::Template.new("#{Barcher::Client::API_ENDPOINT}/locations")
    location_endpoint = Addressable::Template.new("#{Barcher::Client::API_ENDPOINT}/locations/{id}")
    rankings_endpoint = Addressable::Template.new("#{Barcher::Client::API_ENDPOINT}/locations/{id}/rankings/{ranking_id}")
    stub_request(:get, locations_endpoint).
      with(:headers => {'Accept'=>'application/json', 'Authorization'=>'Bearer sample'}).
      to_return(:status => 200, :body => "{}", :headers => {})

    stub_request(:get, location_endpoint).
      with(:headers => {'Accept'=>'application/json', 'Authorization'=>'Bearer sample'}).
      to_return(:status => 200, :body => "{}", :headers => {})

    stub_request(:get, rankings_endpoint).
      with(:headers => {'Accept'=>'application/json', 'Authorization'=>'Bearer sample'}).
      to_return(:status => 200, :body => "{}", :headers => {})

  end

  def test_locations
    assert_equal @client.locations.parsed_response, "{}"
  end

  def test_single_location
    assert_equal @client.location("1234").parsed_response, "{}"
  end

  def test_rankings_at_location
    assert_equal @client.rankings_at_location("1234", 1).parsed_response, "{}"
  end

end

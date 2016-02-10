require 'rubygems'
require 'httparty'

module Barcher
  class Client
    include HTTParty
    API_ENDPOINT = "https://api.clashofclans.com/v1"

    def initialize(options={})
      self.class.base_uri API_ENDPOINT
      self.class.headers "Accept" => "application/json", "authorization" => "Bearer #{options[:token]}"
    end

    def clan_search(options={})
      #valid_options = %i{name war_frequency location_id min_members min_clan_points min_clan_level limit after before}
      self.class.get("/clans", camelize_options(options))
    end

    def find_clan(clan_tag)
      self.class.get("/clans/#{clan_tag}")
    end

    def clan_members_for(clan_tag)
      self.class.get("/clans/#{clan_tag}/members")
    end

    def locations
      self.class.get("/locations")
    end

    def location(id)
      self.class.get("/locations/#{id}")
    end

    def rankings_at_location(location_id, ranking_id)
      self.class.get("/locations/#{location_id}/rankings/#{ranking_id}")
    end

    def leagues
      self.class.get("/leagues")
    end

    # TODO: move out of here or use ActiveSupport
    def camelize_options(options)
      options.dup.each do |k,v|
        options[k.to_s.split('_').inject([]){|c,word| c.push(c.empty? ? word : word.capitalize)}.join] = v
      end
    end

  end
end

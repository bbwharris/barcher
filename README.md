## Barcher
![Barcher Image](https://s3-us-west-2.amazonaws.com/barcher/barb-archers.jpg)

A simple wrapper to access the clash of clans API in Ruby

### Usage
```
  gem install barcher
```

Then from a REPL (irb, rails c)

```
  barcher = Barcher::Client.new(token: "your token from your account")
  
  barcher.clan_search(options)

  barcher.find_clan("clan tag")

  barcher.clan_members_for("clan tag")

  barcher.locations

  barcher.location(location_id)

  barcher.rankings_at_location(location_id, ranking_id)

  barcher.leagues
```

## Note
This is just a first pass at getting something working, there are no error checks applied, so undesirable behavior will occur.

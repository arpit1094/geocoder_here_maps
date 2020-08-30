# Deprecated

This repository is no longer maintained, the gem will be maintained at https://github.com/cloudlogistics/geocoder_here_maps going forward. Releases will be done as usual.


# GeocoderHereMaps

An "extension" for [`geocoder`](https://github.com/alexreisner/geocoder) which adds support for using additional HERE maps APIs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'geocoder_here_maps'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geocoder_here_maps

## Usage

Geocoding and reverse geocoding will work in the same way as provided by `geocoder` gem.

To use autocomplete API

```ruby
Geocoder.search('Delhi', lookup: :here_suggest)
```

To use calculateroute API

```ruby
Geocoder.search([[26.1215649, -80.1273346], [34.8440896, -82.4057]],
                lookup: :here_calculate_route,
                params: { mode: 'fastest;truck', departure: "now", routeattributes: 'shape'}).first
```


If multiple lookups are used in application no need to define separate configuration for these new lookups in `geocoder.rb`. They will use the configuration defined for here maps.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/geocoder_here_maps. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GeocoderHereMaps project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/geocoder_here_maps/blob/master/CODE_OF_CONDUCT.md).

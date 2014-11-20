# PontDelPetroli

simple ruby gem that fetches the real time data from Badalonas pont del petroli buoy

## Installation

Add this line to your application's Gemfile:

    gem 'pont_del_petroli'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pont_del_petroli

## Usage

At the moment is plain simple:

    require 'pont_del_petroli'

    PontDelPetroli.now # returns the latests swell data
    PontDelPetroli.all # returns an array with all the avaiable swell data

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pont_del_petroli/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

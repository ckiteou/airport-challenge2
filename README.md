[![Build Status](https://travis-ci.org/ckiteou/airport-challenge2.svg?branch=master)](https://travis-ci.org/ckiteou/airport-challenge2.svg?branch=master)
[![Coverage Status](https://coveralls.io/repos/github/ckiteou/airport-challenge2/badge.svg?branch=master)](https://coveralls.io/github/ckiteou/airport-challenge2?branch=master)
[![Test Coverage](https://api.codeclimate.com/v1/badges/cbfbf1b058c4f1bc3447/test_coverage)](https://codeclimate.com/github/ckiteou/airport-challenge2/test_coverage)

Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/----------------``
                =  ===(_________)

```
### How to use

To run locally:
```
$ clone repo
$ cd airport-challenge
$ irb

```

```
$ irb
2.4.0 :001 > require './lib/airport'
 => true
2.4.0 :002 > airport = Airport.new
 => #<Airport:0x007ff3da1b2ee0 @planes=[], @weather=#<Weather:0x007ff3da1b2eb8>, @capacity=20>
2.4.0 :003 > plane_1 = Plane.new('BA123')
 => #<Plane:0x007ff3da1a2ce8 @registration="BA123", @flying=false>
2.4.0 :004 > airport.land(plane_1)
 => [#<Plane:0x007ff3da1a2ce8 @registration="BA123", @flying=false>]
2.4.0 :005 > plane_2 = Plane.new('FR2139')
 => #<Plane:0x007ff3da1126e8 @registration="FR2139", @flying=false>
2.4.0 :006 > airport.land(plane_2)
 => [#<Plane:0x007ff3da1a2ce8 @registration="BA123", @flying=false>, #<Plane:0x007ff3da1126e8 @registration="FR2139", @flying=false>]
2.4.0 :007 > airport.take_off(plane_1)
 => true
2.4.0 :008 > plane_1.flying?
 => true
```

To run the tests:
```
$ rpsec
```

### Technologies
- Ruby 2.4.0
- RSpec


### Authors
- Costas Kiteou

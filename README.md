# SimpleWhois

Tiny limited whois client implementation by ruby. 

## Motivation

A major whois client in Ruby is [weppos/whois](https://github.com/weppos/whois). @weppos' gem is really great, it determins whois server dynamically. But, I created SimpleWhois because I simply wanted a client that queries to a specified whois server such like `Whois::Client.new(host: 'whois.abc.net')`.

## Installation

Add this line to your application's Gemfile:

    gem 'simple_whois'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_whois

## Usage

To lookup

    client = SimpleWhois::Client.new server: 'whois.radb.net'   
    record = client.lookup '8.8.8.8'
    record.to_s
      => "route:      8.8.8.0/24
        descr:      Google
        origin:     AS15169
        notify:     radb-contact@google.com
        mnt-by:     MAINT-AS15169
        changed:    radb-contact@google.com 20130806
        source:     RADB

        route:         8.0.0.0/9
        descr:         Proxy-registered route object
        origin:        AS3356
        remarks:       auto-generated route object
        remarks:       this next line gives the robot something to recognize
        remarks:       L'enfer, c'est les autres
        remarks:
        remarks:       This route object is for a Level 3 customer route
        remarks:       which is being exported under this origin AS.
        remarks:
        remarks:       This route object was created because no existing
        remarks:       route object with the same origin was found, and
        remarks:       since some Level 3 peers filter based on these objects
        remarks:       this route may be rejected if this object is not created.
        remarks:
        remarks:       Please contact routing@Level3.net if you have any
        remarks:       questions regarding this object.
        mnt-by:        LEVEL3-MNT
        changed:       roy@Level3.net 20060203
        source:        LEVEL3"

    record.match(/^origin:\s+(\w+)$/)
      => [MatchData]

To set a custom port

    lient = SimpleWhois::Client.new server: 'whois.myserver', port: 10043


To set a custom timeout in second. Default is 10 seconds.

    client = SimpleWhois::Client.new server: 'whois.myserver', timeout: 3

## Errors

raise `SimpleWhois::CoonectionError` if connectivity problem is occur between the client and the whois server.

raise `Timeout::Error` if whois lookuping is time out.

## TODO

Write tests!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

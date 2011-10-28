#!/usr/bin/env ruby
# encoding: UTF-8

$LOAD_PATH.delete(File.dirname(__FILE__))
require 'launchy'
require 'wroc_love'

def say(msg)
  puts msg
end

def banner
  say <<-EOF

wroc_love.rb Conference 2012
============================
  Ruby and Friends

  March 10-11, 2012
  Wroclaw, Poland

Commands:
  web       Visit conference website
  map       Launch Google map
  follow    Follow us on Twitter
  tweet     Spread the word!
  flights   Check flights to Wrocław from airports near you!
  EOF
end

cmd = ARGV.shift

case cmd
when nil
  banner
when "speakers"
  puts "@apotonick     (Nick Sutterer)"
  puts "@aslakhellesoy (Aslak Hellesøy)"
  puts "@drogus        (Piotr Sarnacki)"
  puts "you ??         (http://c4p.wrocloverb.com)"
  puts
when "web"
  Launchy.open("http://wrocloverb.com")
when "map"
  Launchy.open("http://maps.google.pl/maps/ms?msid=209535756088857600233.0004a7f42b9530ef04382&msa=0&ll=49.05227,12.65625&spn=11.971802,28.45459")
when "follow"
  Launchy.open("http://twitter.com/wrocloverb")
when "tweet"
  Launchy.open("http://twitter.com/home?status=Fresh%20Ruby-oriented%20conference%20in%20Wroc%C5%82aw%2C%20Poland.%20Get%20ready%20March%202012%3A%20http%3A%2F%2Fwrocloverb.com%20Please%20RT")
when "flights"
  require 'geocoder'
  require 'socket'
  require 'net/http'
  require 'uri'

  url = "http://automation.whatismyip.com/n09230945.asp".freeze

  uri = URI.parse(url)
  res = Net::HTTP.start(uri.host, uri.port) {|http|
    http.get(uri.path)
  }
  ip = res.body
  puts "it seems that your public ip is: #{ip}"
  location = Geocoder.search(ip).first
  loc = [location.latitude, location.longitude]
  # loc = [51.1, 17.0333] Wrocław
  puts "so we guess that your location is: #{loc}"

  puts "let's try to find some airports near you (visit the link to check the flights to Wrocław):"
  WrocLove::Airport.nearest(loc).each do |airport|
    puts airport.description
  end
end

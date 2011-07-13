#!/usr/bin/env ruby

require 'launchy'

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
EOF
end

cmd = ARGV.shift

case cmd
when nil
  banner
when "web"
  Launchy.open("http://wrocloverb.com")
when "map"
  Launchy.open("http://maps.google.com/maps?q=Wroclaw,+Poland&ll=48.283193,14.545898&spn=23.043139,56.90918&sll=47.100045,-22.412109&sspn=49.743722,113.818359&z=5")
when "follow"
  Launchy.open("http://twitter.com/wrocloverb")
when "tweet"
  Launchy.open("http://twitter.com/home?status=Fresh%20Ruby-oriented%20conference%20in%20Wroc%C5%82aw%2C%20Poland.%20Get%20ready%20March%202012%3A%20http%3A%2F%2Fwrocloverb.com%20Please%20RT")
end

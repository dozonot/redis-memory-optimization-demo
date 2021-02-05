require 'rubygems'
require 'redis'

r = Redis.new
(0..100000).each{|id|
	key = "object:#{id}"
	r.set(key,"val")
}

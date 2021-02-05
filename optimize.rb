require 'rubygems'
require 'redis'

UseOptimization = true

def hash_get_key_field(key)
  s = key.split(":")
  if s[1].length > 2
    {:key => s[0]+":"+s[1][0..-3], :field => s[1][-2..-1]}
  else
    {:key => s[0]+":", :field => s[1]}
  end
end

def hash_set(r,key,value)
  kf = hash_get_key_field(key)
  r.hset(kf[:key],kf[:field],value)
end

def hash_get(r,key,value)
  kf = hash_get_key_field(key)
  r.hget(kf[:key],kf[:field],value)
end

r = Redis.new
(0..100000).each{|id|
  key = "object:#{id}"
  if UseOptimization
    hash_set(r,key,"val")
  else
    r.set(key,"val")
  end
}

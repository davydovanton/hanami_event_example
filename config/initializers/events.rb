require 'hanami/events'
require 'redis'
require 'connection_pool'

REDIS = ConnectionPool.new(size: 5, timeout: 5) { Redis.new(host: 'localhost', port: 6379) }
EVENTS = Hanami::Events.initialize(:redis, redis: REDIS)

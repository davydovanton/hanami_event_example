require 'hanami/events'
require 'redis'
require 'connection_pool'

redis = ConnectionPool.new(size: 5, timeout: 5) { Redis.new(host: 'localhost', port: 6379) }
EVENTS = Hanami::Events.build(:redis, redis: redis)

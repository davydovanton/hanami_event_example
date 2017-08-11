class Events
  def all
    REDIS.with { |conn| conn.lrange('hanami.event_store', 0, -1) }.map! { |json| JSON.parse(json) }
  end
end

require "cache_holder"

unless ENV['MIGRATION']
  CacheHolder.instance()
end
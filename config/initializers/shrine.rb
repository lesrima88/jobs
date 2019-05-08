require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"


Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
}

Shrine.plugin :activerecord # or :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
Shrine.plugin :rack_file # for non-Rails apps


if Rails.env.development?
  require "shrine/storage/file_system"
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store")
  }
elsif Rails.env.test?
  require 'shrine/storage/memory'
  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
else
  require "shrine/storage/s3"
  s3_options = {
    access_key_id:     "AKIAI5NUT3DO2I35AGZA",
    secret_access_key: "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",
    region:            "eu-west-2",
    bucket:            "kazii"
  }
  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
    store: Shrine::Storage::S3.new(prefix: "store", **s3_options)
  }
end
Shrine.plugin :activerecord


#s3 = Shrine::Storage::S3.new(
 # bucket: "kazii", # required
  #access_key_id: "AKIAI5NUT3DO2I35AGZA",
  #secret_access_key: "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",
  #region: "eu-west-1",
#)
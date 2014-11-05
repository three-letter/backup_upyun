require "backup"

Backup::Storage.send(:autoload, :Upyun, File.join(File.dirname(__FILE__),"backup/storage/upyun"))

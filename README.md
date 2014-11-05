# BackupUpyun

Upyun Storage support for Backup.

## Installation

Add this line to your application's Gemfile:

    gem 'backup_upyun'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install backup_upyun

## Usage

    require "backup_upyun"
    
    Model.new(:my_test, 'Description for my_test') do
    
        archive :my_archive do |archive|
            archive.add "/Users/iosdev01/work/project/whosv-gem/backupyun/pkg/backupyun-0.0.2.gem"
        end
        
        store_with "Upyun" do |upyun|
            upyun.bucket   = "upyun_bucket"
            upyun.username = "upyun_username"
            upyun.password = "upyun_password"
            upyun.host     = "http://v0.api.upyun.com"
        end
  
    end

## Contributing

1. Fork it ( https://github.com/[my-github-username]/backup_upyun/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

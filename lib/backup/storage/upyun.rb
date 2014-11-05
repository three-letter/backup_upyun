require "rest-client"

module Backup
	module Storage
		class Upyun < Base
			attr_accessor :bucket, :username, :password, :host

			def initialize(model, storage_id = nil, &block)
				super(model, storage_id)

				@path ||= 'backups'

				instance_eval(&block) if block_given?
			end

			private

			def connection
				@connection ||= RestClient::Resource.new("#{@host}/#{@bucket}", :user => @username, :password => @password)
			end

			def transfer!
				remote_path = remote_path_for(@package)

				@package.filenames.each do |filename|
					src = File.join(Config.tmp_path, filename)
					dest = File.join(remote_path, filename)
					Logger.info "#{storage_name} uploading '#{ dest }' from '#{ src }'..."
					File.open(src, 'r') do |file|
						connection[dest].put(file, {})
					end
				end
			end

			def remove!(package)
				remote_path = remote_path_for(package)
				Logger.info "#{storage_name} removing '#{remote_path}'..."
				connection.delete(remote_path)
			end
		end
	end
end


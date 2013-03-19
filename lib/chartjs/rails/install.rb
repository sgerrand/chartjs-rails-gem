require "net/http"
require "net/https"

module Chartjs
	module Rails
		class Install
			JS_SRC = "https://raw.github.com/nnnick/Chart.js/master/Chart.js"
			JS_MIN = "https://raw.github.com/nnnick/Chart.js/master/Chart.min.js"
			JS_DIR = 'vendor/assets/javascripts'

			attr_reader :source, :status, :uri

			def initialize(uri)
				@uri = URI.parse(uri) rescue false
			end

			def download
				false unless @uri

				setup_request

				@response = @request.get @uri.path

				if @response.code == '200'
					@source = @response.body
					@status = 'downloaded'
				end
			end

			def install_source_file(download_path)
				File.open(download_path, 'a') do |file|
					file.puts @source
				end if download
			end

			private

			def setup_request
				@request = Net::HTTP.new(@uri.hostname, @uri.port)
				@request.use_ssl = true if @uri.scheme == 'https'
			end
		end
	end
end

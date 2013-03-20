require "rails"

# Provide a generator for Rails 3.0.x or if the asset pipeline is not enabled
if ::Rails.version < "3.1" || !::Rails.application.config.assets.enabled
	module Chartjs
		module Generators
			class InstallGenerator < ::Rails::Generators::Base
				desc "This generator installs Chart.js"
				source_root File.expand_path('../../../../../vendor/assets/javascripts', __FILE__)

				def copy_chartjs
					say_status("copying", "Chart.js", :green)
					['chart.js', 'chart.min.js'].each do |file|
						copy_file file, File.join("public/javascripts", file)
					end
				end
			end
		end
	end
else
	module Chartjs
		module Generators
			class InstallGenerator < ::Rails::Generators::Base
				desc "Just show instructions so people will know what to do when mistakenly using generator for Rails 3.1 apps"

				def do_nothing
					say_status("deprecated", "You are using Rails 3.1 with the asset pipeline enabled, so this generator is not needed.")
					say_status("", "The necessary files are already in your asset pipeline.")
					say_status("", "Just add `//= require chart` to your app/assets/javascripts/application.js")
					say_status("", "If you do not want the asset pipeline enabled, you may turn it off in application.rb and re-run this generator.")
					# ok, nothing
				end
			end
		end
	end
end

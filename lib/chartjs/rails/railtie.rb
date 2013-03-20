# Ensure that Rails 3.0.x, as well as Rails >= 3.1.x with asset pipeline disabled
# get a minified version of the scripts in production
module Chartjs
	module Rails
		class Railtie < ::Rails::Railtie
			config.before_configuration do
				if config.action_view.javascript_expansions
					if ::Rails.root.join("public/javascripts/Chart.min.js").exist?
						cjs_defaults = %w(Chart)
						cjs_defaults.map!{|a| a + ".min" } if ::Rails.env.production? || ::Rails.env.test?
					else
						cjs_defaults = ::Rails.env.production? || ::Rails.env.test? ? %w(Chart.min) : %w(Chart)
					end
				end
			end
		end
	end
end

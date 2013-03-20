require "chartjs/rails/install"
require "echoe"
require "tmpdir"

Echoe.new("chartjs-rails") do |gem|
  gem.author = 'Sasha Gerrand'
  gem.email = 'rubygem-chartjs-rails@sgerrand.com'
  gem.summary = 'Use Chart.js with your Rails application'
  gem.description = 'This gem provides Chart.js for your Rails application via the asset pipeline'
  gem.runtime_dependencies = ['railties >=3']
  gem.development_dependencies = ['echoe ~>4.6.3', 'minitest', 'rails >=3']
  gem.project = 'chartjs-rails'
  gem.retain_gemspec = false
  gem.rubygems_version = '>=1.8.4'
  gem.url = 'https://github.com/sgerrand/chartjs-rails-gem'
end

namespace :chartjs do
	task :clean do |t|
		Dir.glob(File.join(Chartjs::Rails::Install::JS_DIR, '*.js')).each do |f|
			File.delete f
		end
	end

	desc 'Install Chart.js source files from the remote master.'
	task :install_from_source => :clean do |t|
		[Chartjs::Rails::Install::JS_SRC, Chartjs::Rails::Install::JS_MIN].each do |remote_file|
			installer = Chartjs::Rails::Install.new(remote_file)
			file_path = File.join(Chartjs::Rails::Install::JS_DIR, File.basename(remote_file).downcase)

			installer.install_source_file file_path
		end
	end
end

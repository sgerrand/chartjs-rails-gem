# chartjs-rails

Chart.js! With Rails!

This gem provides:

* Chart.js 

## Versions

The chartjs-rails gem will follow these version guidelines:

		patch version bump = updates to chartjs-rails, and patch-level updates to Chart.js
		minor version bump = minor-level updates to Chart.js
		major version bump = major-level updates to Chart.js and updates to Rails which may be backwards-incompatible

## Installation

Add this line to your application's Gemfile:

    gem 'chartjs-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chartjs-rails

## Rails 3.1 or greater (with asset pipeline enabled)

The Chart.js files will be added to the asset pipeline and available for you to use. Add these lines to app/assets/javascripts/application.js:

    //= require chart

## Rails 3.0 (or greater with asset pipeline disabled)

This gem adds a single generator: chartjs:install. Running the generator will copy Chart.js to the public/javascripts directory.

This gem will also hook into the Rails configuration process, adding Chart.js to the javascript files included by the javascript_include_tag(:defaults) call. While this gem contains the minified and un-minified versions of Chart.js, only the minified versions will be included in the :defaults when Rails is run in production or test mode (un-minified versions will be included when Rails is run in development mode).

To invoke the generator, run:

    rails generate chartjs:install #--ui to enable Chart.js

You're done!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Acknowledgements

* Nick Downie, for creating the [Chart.js](http://chartjs.org) library.
* The [jquery-rails](https://github.com/rails/jquery-rail) gem developers for inspiration.

Copyright [Sasha Gerrand](http://sgerrand.com), released under the MIT License.

module.exports = (config) ->
	config.set
		files: [
			'app/lib/angular/angular.js'
			'app/lib/angular/angular-route.js'
			'app/lib/angular/angular-mocks.js'
			'src/coffee/**/*.coffee'
			'spec/**/*.coffee'
		]

		singleRun: true

		frameworks: [
			'jasmine'
		]

		browsers: [
			'Chrome'
		]

		plugins: [
			'karma-jasmine',
			'karma-chrome-launcher'
			'karma-coffee-preprocessor'
		]

		preprocessors:
			'**/*.coffee': ['coffee']

		coffeePreprocessor:
			options:
				bare: true
				sourceMap: false
		
			transformPath: (path) ->
				path.replace /\.coffee$/, '.js'

	return
module.exports = (grunt) ->
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-stylus'
	grunt.loadNpmTasks 'grunt-contrib-jade'
	grunt.loadNpmTasks 'grunt-contrib-connect'
	grunt.loadNpmTasks 'grunt-karma'

	grunt.initConfig

		karma:
			unit:
				configFile: 'karma.conf.coffee'

		watch:
			coffee:
				files: 'src/coffee/**/*.coffee'
				tasks: ['coffee:compile']
			jade:
				files: 'src/**/*.jade'
				tasks: ['jade:compile']
			stylus:
				files: 'src/stylus/**/*.stylus'
				tasks: ['stylus:compile']
			options:
				livereload: true

		connect:
			server:
				options:
					port: 9000
					base: 'app/'
					keepalive: true
					livereload: true
					open: true

		coffee:
			compile:
				expand: true
				cwd: "#{__dirname}/src/coffee/"
				src: '**/*.coffee'
				dest: 'app/js/'
				ext: '.js'
				options:
					bare: true

		jade:
			compile:
				expand: true
				cwd: "#{__dirname}/src/"
				src: '**/*.jade'
				dest: 'app/'
				ext: '.html'
				options:
					client: false
					pretty: true

		stylus:
			compile:
				expand: true
				cwd: "#{__dirname}/src/stylus"
				src: '**/*.stylus'
				dest: 'app/css'
				ext: '.css'


	grunt.registerTask 'default', [
		'karma:unit'
		'coffee:compile'
		'jade:compile'
		'stylus:compile'
	]
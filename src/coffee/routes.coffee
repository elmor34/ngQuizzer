ngq.config ($routeProvider) ->

	$routeProvider.when '/home',
		templateUrl: 'partials/home.html'
		controller: 'HomeCtrl'
		controllerAs: 'h'

	$routeProvider.when '/quiz',
		templateUrl: 'partials/quiz.html'
		controller: 'QuizCtrl'
		controllerAs: 'q'
		resolve:
			index: () ->
				0

	$routeProvider.when '/quiz/:index',
		templateUrl: 'partials/quiz.html'
		controller: 'QuizCtrl'
		controllerAs: 'q'
		resolve:
			index: ($route) ->
				parseInt $route.current.params.index, 10

	$routeProvider.when '/results',
		templateUrl: 'partials/results.html'
		controller: 'ResultsCtrl'
		controllerAs: 'r'

	$routeProvider.otherwise
		redirectTo: '/home'

	return
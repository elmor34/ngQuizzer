describe 'controllers', () ->

	beforeEach module 'ngq.controllers'

	describe 'HomeCtrl', () ->
		it 'should exist', inject ($controller) ->

			myCtrl1 = $controller 'HomeCtrl', 
				$scope: {}

			expect(myCtrl1).toBeDefined()
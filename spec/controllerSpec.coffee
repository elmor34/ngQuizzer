
describe 'controllers', () ->

  beforeEach module 'ngq.controllers'
  
  it 'should exist', inject ($controller) ->
 
    myCtrl1 = $controller 'HomeCtrl', 
      $scope: {}

    expect(myCtrl1).toBeDefined()
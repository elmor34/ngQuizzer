var ngqs;

ngqs = angular.module('ngq.services', []);

ngqs.service('QuestionSrvc', function() {
  this.questions = [
    {
      "id": 1,
      "text": "Alfred Hitchcock had no bellybutton."
    }, {
      "id": 2,
      "text": "You can't sneeze in your sleep."
    }, {
      "id": 3,
      "text": "Ice is a mineral."
    }, {
      "id": 4,
      "text": "There are 31,557,600 seconds in a year."
    }
  ];
});

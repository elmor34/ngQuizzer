var ngqs;

ngqs = angular.module('ngq.services', []);

ngqs.service('QuestionSrvc', function() {
  this.questions = [
    {
      id: 1,
      text: "The study of plants is known as botany.",
      correct: true
    }, {
      id: 2,
      text: "Herbivores eat meat.",
      correct: false
    }, {
      id: 3,
      text: "Spiders have six legs.",
      correct: false
    }, {
      id: 4,
      text: "Kelvin is a measure of temperature.",
      correct: true
    }
  ];
});

ngqs.service('AnswerSrvc', function() {
  this.answers = [];
});

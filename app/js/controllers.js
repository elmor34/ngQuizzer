var ngqc;

ngqc = angular.module('ngq.controllers', ['ngq.services']);

ngqc.controller('HomeCtrl', function(AnswerSrvc, $location) {
  this.startQuiz = function() {
    AnswerSrvc.answers = [];
    return $location.path('/quiz');
  };
});

ngqc.controller('QuizCtrl', function(QuestionSrvc, AnswerSrvc, index, $location) {
  var question, submit;
  question = this.question = QuestionSrvc.questions[index];
  this.index = index + 1;
  submit = function(selected) {
    var newIndex;
    newIndex = index + 1;
    AnswerSrvc.answers[index] = {
      id: question.id,
      answer: selected
    };
    if (newIndex < QuestionSrvc.questions.length) {
      return $location.path('/quiz/' + newIndex);
    } else {
      return $location.path('/results');
    }
  };
  this.selectTrue = function() {
    return submit(true);
  };
  this.selectFalse = function() {
    return submit(false);
  };
});

ngqc.controller('ResultsCtrl', function(QuestionSrvc, AnswerSrvc) {
  this.questions = QuestionSrvc.questions;
  this.answers = AnswerSrvc.answers;
  this.isQuestionCorrect = function(index) {
    return (AnswerSrvc.answers[index] != null) && AnswerSrvc.answers[index].answer === QuestionSrvc.questions[index].correct;
  };
  this.answerText = function(index) {
    if (AnswerSrvc.answers[index] == null) {
      return "Not answered";
    } else if (AnswerSrvc.answers[index].answer) {
      return "True";
    } else {
      return "False";
    }
  };
});

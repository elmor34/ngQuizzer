ngqc = angular.module 'ngq.controllers', ['ngq.services']

ngqc.controller 'HomeCtrl', (AnswerSrvc, $location) ->
	@startQuiz = () ->
		AnswerSrvc.answers = []
		$location.path '/quiz'
	return

ngqc.controller 'QuizCtrl', (QuestionSrvc, AnswerSrvc, index, $location) ->

	question = @question = QuestionSrvc.questions[index];
	@index = index + 1;

	submit = (selected) ->
		newIndex = index + 1

		AnswerSrvc.answers[index] = 
			id: question.id
			answer: selected

		if newIndex < QuestionSrvc.questions.length
			$location.path '/quiz/' + newIndex
		else
			$location.path '/results'

	@selectTrue = () ->
		submit(true)

	@selectFalse = () ->
		submit(false)

	return

ngqc.controller 'ResultsCtrl', (QuestionSrvc, AnswerSrvc) ->

	@questions = QuestionSrvc.questions
	@answers = AnswerSrvc.answers

	@isQuestionCorrect = (index) ->
		AnswerSrvc.answers[index]? and AnswerSrvc.answers[index].answer is QuestionSrvc.questions[index].correct

	@answerText = (index) ->
		if !AnswerSrvc.answers[index]?
			"Not answered"
		else if AnswerSrvc.answers[index].answer
			"True"
		else 
			"False"
	return
describe 'controllers', () ->

	beforeEach module 'ngq.controllers'

	describe 'HomeCtrl', () ->
		it 'should exist', inject ($controller) ->

			myCtrl1 = $controller 'HomeCtrl', 
				$scope: {}

			expect(myCtrl1).toBeDefined()

	describe 'QuizCtrl', () ->

		myAnswers = 
			answers: [] 

		it 'should exist', inject ($controller) ->

			myCtrl1 = $controller 'QuizCtrl', 
				$scope: {}
				index: 0

			expect(myCtrl1).toBeDefined()

		it 'submit should submit answer', inject ($controller) ->

			myCtrl1 = $controller 'QuizCtrl', 
				$scope: {}
				AnswerSrvc: myAnswers
				index: 0

			expect(myAnswers.answers[0]).toBeUndefined()

			myCtrl1.selectTrue()
			expect(myAnswers.answers[0].answer).toBe(true)

			myCtrl1.selectFalse()
			expect(myAnswers.answers[0].answer).toBe(false)

	describe 'ResultsCtrl', () ->

		myCtrl = undefined 

		beforeEach module () ->
			($controller) ->
				myCtrl = $controller 'ResultsCtrl', 
					$scope: {}
					QuestionSrvc: 
						questions: [
								id: 1
								text: "The study of plants is known as botany."
								correct: true
							,
								id: 2
								text: "Herbivores eat meat."
								correct: false
							,
								id: 3
								text: "Spiders have six legs."
								correct: false
							,
								id: 4
								text: "Kelvin is a measure of temperature."
								correct: true
						]
					AnswerSrvc: 
						answers: [	
								id: 1
								answer: true
							,
								id: 2
								answer: true
							,
								id: 3
								answer: false
						]

		it 'should exist', inject ($controller) ->
			expect(myCtrl).toBeDefined()

		describe 'isQuestionCorrect', () ->
			it 'should work correctly', inject () ->
				expect(myCtrl.isQuestionCorrect(0)).toBe(true)
				expect(myCtrl.isQuestionCorrect(1)).toBe(false)
				expect(myCtrl.isQuestionCorrect(3)).toBe(false)


		describe 'answerText', () ->
			it 'should work correctly', inject () ->
				expect(myCtrl.answerText(0)).toBe('True')
				expect(myCtrl.answerText(2)).toBe('False')
				expect(myCtrl.answerText(3)).toBe('Not answered')


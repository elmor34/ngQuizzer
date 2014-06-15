describe 'services', () ->

	beforeEach module 'ngq.services'

	describe 'QuestionSrvc', () ->

		it 'should exist', inject (QuestionSrvc) ->
			expect(QuestionSrvc).toBeDefined()

		it 'should init with questions', inject (QuestionSrvc) ->
			expect(QuestionSrvc.questions.length).toBeGreaterThan(0)

	describe 'AnswerSrvc', () ->

		it 'should exist', inject (AnswerSrvc) ->
			expect(AnswerSrvc).toBeDefined()

		it 'answers should exist', inject (AnswerSrvc) ->
			expect(AnswerSrvc.answers).toBeDefined()
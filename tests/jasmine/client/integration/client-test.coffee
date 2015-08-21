describe 'client side todo-list testing', () ->
	describe 'body helper tests for task hider button', () ->
		Meteor.subscribe 'tasks'

		Template.body.helpers
			tasks: ->
				if Session.get('hideCompleted')
# If hide completed is checked, filter tasks
					Tasks.find { checked: $ne: true }, sort: createdAt: -1
					it 'checks if hide completed is checked, if so it filters tasks', () ->
						expect(Tasks.find {checked: $ne: true}).toContain(sort: createdAt: -1)
				else
# Otherwise, return all of the tasks
					Tasks.find {}, sort: createdAt: -1
					it 'returns all of the tasks', () ->
						expect(Tasks.find {}).toContain(sort: createdAt: -1)
			hideCompleted: ->
				Session.get 'hideCompleted'
			incompleteCount: ->
				Tasks.find(checked: $ne: true).count()
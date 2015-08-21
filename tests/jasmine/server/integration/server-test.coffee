describe 'server side todo-list testing', () ->
	describe 'if Meteor is server', () ->
		it 'Checks that only tasks that are public or private are published', () ->
			Meteor.publish 'tasks', ->
				Tasks.find $or: [
					{ private: $ne: true }
					{ owner: @userId }
				]
				expect(Tasks.find $or:[{}]).toContain(owner: @userID)
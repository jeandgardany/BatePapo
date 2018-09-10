#App.sala = App.cable.subscriptions.create "SalaChannel",
App.sala_id = document.location.pathname.split("/").pop() # retrieve the sala_id

App.sala = App.cable.subscriptions.create { channel: "SalaChannel", sala_id: App.sala_id || 0 },
#App.sala = App.cable.subscriptions.create { channel: "SalaChannel", sala_id: messages.data('sala-id') },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert(data['message'])
    #$('#messages').append data['message']
    #messages.append data['message']

  speak: (message) ->
  	#@perform 'speak', message: message, sala_id: sala_id
	  @perform 'speak', message: message
    #$('#messages').append data['message']

$(document).on 'keypress', '[data-behavior~=sala_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.sala.speak event.target.value
event.preventDefault()
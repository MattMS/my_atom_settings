# My init script
#
# Atom will evaluate this file each time a new window is opened.
# It is run after packages are loaded/activated and after the previous editor state has been restored.
#
# An example hack to log to the console when each text editor is saved:
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"


dispatch_commands = (names)->
	# https://atom.io/docs/api/v1.8.0/AtomEnvironment#instance-workspace
	# https://atom.io/docs/api/v1.8.0/Workspace#instance-getActiveTextEditor
	return unless editor = atom.workspace.getActiveTextEditor()

	# https://atom.io/docs/api/v1.8.0/AtomEnvironment#instance-views
	# https://atom.io/docs/api/v1.8.0/ViewRegistry#instance-getView
	view = atom.views.getView editor

	for name in names
		# https://atom.io/docs/api/v1.8.0/AtomEnvironment#instance-commands
		# https://atom.io/docs/api/v1.8.0/CommandRegistry#instance-dispatch
		atom.commands.dispatch view, name


atom.commands.add 'atom-text-editor', 'custom:vim-mode-newline', (event)->
	dispatch_commands [
		'vim-mode:move-down'
		'vim-mode:move-to-beginning-of-line'
		# 'editor:move-to-start-of-line'
		'editor:newline'
		'vim-mode:move-up'
	]

	# editor = atom.workspace.getActiveTextEditor()
	# editor.selectLinesContainingCursors()
	# editor.insertText '\n'


atom.commands.add 'atom-text-editor', 'custom:vim-mode-newline-above', ->
	dispatch_commands [
		'vim-mode:move-to-beginning-of-line'
		'editor:newline'
	]


atom.commands.add 'atom-text-editor', 'custom:vim-mode-split', (event)->
	dispatch_commands [
		'editor:newline'
	]

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


c = (names)->
	editor = atom.workspace.getActiveTextEditor()

	view = atom.views.getView editor

	for name in names
		atom.commands.dispatch view, name


atom.commands.add 'atom-text-editor', 'custom:vim-mode-newline', (event)->
	c [
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
	c [
		'vim-mode:move-to-beginning-of-line'
		'editor:newline'
	]


atom.commands.add 'atom-text-editor', 'custom:vim-mode-split', (event)->
	c [
		'editor:newline'
	]

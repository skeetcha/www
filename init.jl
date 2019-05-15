using Gtk, GtkExtensions

function init!(window::MainWindow)
	window.currentProject = Project()
	initViews(window, window.box)
	showall(window)
end
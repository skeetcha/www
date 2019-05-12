using Gtk, GtkExtensions

function init!(window::MainWindow, menuBar)
	window.menuBar = menuBar
	window.currentProject = Project()
	initViews(window)
	push!(window, menuBar)
	showall(window)
end
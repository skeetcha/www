function init!(window::MainWindow)
	window.currentProject = Project()
	initViews(window)
	showall(window)
end
function newProject(widgetptr::Ptr, user_data)
	if debug
		println("Creating a new project...")
	end

	window = user_data
	window.currentProject = Project()

	return nothing
end

function openProject(widgetptr::Ptr, user_data)
	if debug
		println("Opening a project...")
	end

	window = user_data
	projectFile = open_dialog("Open project", window, ("*.wp",))
	window.currentProject = deserialize(projectFile)

	return nothing
end

function saveProject(widgetptr::Ptr, user_data)
	if debug
		println("Saving the project...")
	end

	window = user_data
	filename = save_dialog("Save project", window, ("*.wp",))
	if !occursin(".wp", filename)
		filename = string(filename, ".wp")
	end
	serialize(filename, window.currentProject)
	return nothing
end

function quitApp(widgetptr::Ptr, user_data)
	if debug
		println("Quitting the application...")
	end

	window = user_data
	destroy(window)
	return nothing
end

function addIssue(widgetptr::Ptr, user_data)
	if debug
		println("Redirecting to the issues page...")
	end

	window = user_data
	info_dialog("Please go to https://github.com/skeetcha/www/issues to submit an issue.")
	return nothing
end

function about(widgetptr::Ptr, user_data)
	if debug
		println("Display about info...")
	end

	window = user_data
	info_dialog("Wacky Worldbuilding Workshop v0.1
Coded and Created by Daniel Unterholzner")
	return nothing
end

function MainMenu(window::MainWindow)
	menuBar = GtkMenuBar() |>
		(fileMenu = GtkMenuItem("_File")) |>
		(toolsMenu = GtkMenuItem("_Tools")) |>
		(helpMenu = GtkMenuItem("_Help"))

	# File Menu
	buildmenu(
		[
			MenuItem("New Project", newProject),
			MenuItem("Open Project", openProject),
			MenuItem("Save Project", saveProject),
			GtkSeparatorMenuItem,
			MenuItem("Quit", quitApp)
		],
		fileMenu,
		(window)
	)

	# Tools Menu
	#buildmenu(
	#	[
	#		# ?
	#	],
	#	toolsMenu,
	#	(window)
	#)

	# Help Menu
	buildmenu(
		[
			MenuItem("Issue", addIssue),
			GtkSeparatorMenuItem,
			MenuItem("About", about)
		],
		helpMenu,
		(window)
	)

	return menuBar
end
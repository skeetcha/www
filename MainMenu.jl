function newProject(widgetptr::Ptr, user_data)
	if debug
		println("Creating a new project...")
	end

	window = user_data
	window.currentProject = Project()

	return nothing
end

function newLang(widgetptr::Ptr, user_data)
	if debug
		println("Creating a new language...")
	end

	window = user_data
	# Create a language

	return nothing
end

function newSystem(widgetptr::Ptr, user_data)
	if debug
		println("Creating a new planetary system...")
	end

	window = user_data
	# Create a planetary system

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

function openLang(widgetptr::Ptr, user_data) # This might be changed to Import Language
	if debug
		println("Opening a language...")
	end

	window = user_data
	# Open the language

	return nothing
end

function openSystem(widgetptr::Ptr, user_data) # This might be changed to Import System
	if debug
		println("Opening a planetary system...")
	end

	window = user_data
	# Open the planetary system

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

function openIssue(widgetptr::Ptr, user_data)
	if debug
		println("Redirecting to the issues page...")
	end

	window = user_data
	info_dialog("Please go to https://github.com/skeetcha/www/issues to submit an issue.")
	return nothing
end

function openAbout(widgetptr::Ptr, user_data)
	if debug
		println("Display about info...")
	end

	window = user_data
	info_dialog("Wacky Worldbuilding Workshop v0.1
Coded and Created by Daniel Unterholzner")
	return nothing
end

function setupSignals(builder::GtkBuilder)
	newProjectId = signal_connect(newProject, builder["newProjectMi"], "activate")
	newLangId = signal_connect(newLang, builder["newLangMi"], "activate")
	newSystemId = signal_connect(newSystem, builder["newSystemMi"], "activate")
	openProjectId = signal_connect(openProject, builder["openProjectMi"], "activate")
	openLangId = signal_connect(openLang, builder["openLangMi"], "activate")
	openSystemId = signal_connect(openSystem, builder["openSystemMi"], "activate")
	#saveProjectId = signal_connect(saveProject, builder["saveProjectMi"], "activate")
	quitAppId = signal_connect(quitApp, builder["quitMi"], "activate")
	openIssueId = signal_connect(openIssue, builder["issuesMi"], "activate")
	openAboutId = signal_connect(openAbout, builder["aboutMi"], "activate")
end
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

function openProject(widgetptr)
	if debug
		println("Opening a project...")
	end

	projectFile = open_dialog("Open project", window, ("*.wp",))
	window.currentProject = deserialize(projectFile)

	return nothing
end

function importLang(widgetptr)
	if debug
		println("Opening a language...")
	end

	# Import a language

	return nothing
end

function importSystem(widgetptr)
	if debug
		println("Opening a planetary system...")
	end

	# Import a planetary system

	return nothing
end

function exportLang(widgetptr)
	if debug
		println("Exporting a language...")
	end

	# Export a language

	return nothing
end

function exportSystem(widgetptr)
	if debug
		println("Exporting a planetary system...")
	end

	# Export a planetary system

	return nothing
end

function saveProject(widgetptr)
	if debug
		println("Saving the project...")
	end

	filename = save_dialog("Save project", window, ("*.wp",))
	if !occursin(".wp", filename)
		filename = string(filename, ".wp")
	end
	serialize(filename, window.currentProject)
	return nothing
end

function quitApp(widgetptr)
	if debug
		println("Quitting the application...")
	end

	destroy(window)
	return nothing
end

function langView(widgetptr)
	println(window.currentView)
	if window.currentView != "language"
		if debug
			println("Switching to the language view...")
		end

		v = findViewFromName(window, "language")

		if v != nothing
			switchViews(window, v)
		end
	end

	return nothing
end

function systemView(widgetptr)
	println(window.currentView)
	if window.currentView != "system"
		if debug
			println("Switching to the system view...")
		end

		v = findViewFromName(window, "system")

		if v != nothing
			switchViews(window, v)
		end

		return nothing
	end
end

function openIssue(widgetptr)
	if debug
		println("Redirecting to the issues page...")
	end

	info_dialog("Please go to https://github.com/skeetcha/www/issues to submit an issue.")
	return nothing
end

function openAbout(widgetptr)
	if debug
		println("Display about info...")
	end

	info_dialog("Wacky Worldbuilding Workshop v0.1\nCoded and Created by Daniel Unterholzner")
	return nothing
end

function setupSignals(builder::GtkBuilder)
	newProjectId = signal_connect(newProject, builder["newProjectMi"], "activate")
	newLangId = signal_connect(newLang, builder["newLangMi"], "activate")
	newSystemId = signal_connect(newSystem, builder["newSystemMi"], "activate")
	openProjectId = signal_connect(openProject, builder["openProjectMi"], "activate")
	importLangId = signal_connect(importLang, builder["importLangMi"], "activate")
	importSystemId = signal_connect(importSystem, builder["importSystemMi"], "activate")
	saveId = signal_connect(saveProject, builder["saveMi"], "activate")
	exportLangId = signal_connect(exportLang, builder["exportLangMi"], "activate")
	exportSystemId = signal_connect(exportSystem, builder["exportSystemMi"], "activate")
	quitAppId = signal_connect(quitApp, builder["quitMi"], "activate")

	langViewId = signal_connect(langView, builder["langViewMi"], "activate")
	systemViewId = signal_connect(systemView, builder["systemViewMi"], "activate")

	openIssueId = signal_connect(openIssue, builder["issuesMi"], "activate")
	openAboutId = signal_connect(openAbout, builder["aboutMi"], "activate")
end
mutable struct MainWindow <: GtkWindow
	handle::Ptr{Gtk.GObject}
	builder::GtkBuilder
	menuBar
	statusBar
	currentProject
	views
	box
	currentView

	function MainWindow()
		b = GtkBuilder(filename="forms/main.glade")
		w = b["window"]
		setupSignals(b)
		n = new(w.handle, b)
		n.box = b["box"]
		Gtk.gobject_move_ref(n, w)
	end
end

function initViews(window::MainWindow)
	window.views = []

	blankView = getBlankView()
	conlangView = getConlangView()

	push!(window.views, blankView)
	push!(window.views, conlangView)

	switchViews(window, blankView)
end

function switchViews(window::MainWindow, new_view::View)
	if new_view in window.views
		window.box[1, 2] = new_view.grid
		window.currentView = new_view.name
	end
end

function findViewFromName(window::MainWindow, name::String)
	for v in window.views
		if v.name == name
			return v
		end
	end

	return nothing
end
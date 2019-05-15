mutable struct MainWindow <: GtkWindow
	handle::Ptr{Gtk.GObject}
	builder::GtkBuilder
	menuBar
	statusBar
	currentProject
	views
	box

	function MainWindow()
		b = GtkBuilder(filename="forms/main.glade")
		w = b["window"]
		setupSignals(b)
		n = new(w.handle, b)
		n.box = b["box"]
		Gtk.gobject_move_ref(n, w)
	end
end

function initViews(window::MainWindow, box::GtkGrid)
	views = []
	blankView = View()
	conlangView = View()

	box[1, 2] = blankView.grid
end

function switchViews(window::MainWindow, new_view::View)
	window.box[1, 2] = new_view.grid
end
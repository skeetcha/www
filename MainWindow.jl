using Gtk, GtkExtensions

mutable struct MainWindow <: GtkWindow
	handle::Ptr{Gtk.GObject}
	menuBar
	statusBar
	currentProject
	views

	function MainWindow()
		w = GtkWindow("Wacky Worldbuilding Workshop", 1000, 1000)
		n = new(w.handle)
		Gtk.gobject_move_ref(n, w)
	end
end

function initViews(window::MainWindow)
	views = []
	conlangView = View(window)
end

push!(window::MainWindow, element) = push!(window.handle, element)
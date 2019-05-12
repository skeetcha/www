module WWW

using Gtk, GtkExtensions, Serialization

include("MainWindow.jl")
include("MainMenu.jl")
include("Project.jl")
include("View.jl")

include("init.jl")

function __init__()
	global debug = true
	win = MainWindow()
	init!(win, MainMenu(win))

	if !isinteractive()
		c = Condition()
		signal_connect(win, :destroy) do widget
			notify(c)
		end
		wait(c)
	end
end

end
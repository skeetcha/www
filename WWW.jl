module WWW

using Gtk, GtkExtensions, Serialization

include("View.jl")
include("Project.jl")
include("MainMenu.jl")
include("MainWindow.jl")

include("init.jl")

function __init__()
	global debug = true
	win = MainWindow()
	init!(win)

	if !isinteractive()
		c = Condition()
		signal_connect(win, :destroy) do widget
			notify(c)
		end
		wait(c)
	end
end

end
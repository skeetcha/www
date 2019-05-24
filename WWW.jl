module WWW

using Gtk, GtkExtensions, Serialization, PortAudio

include("ConlangView.jl")

include("View.jl")
include("Project.jl")
include("MainMenu.jl")
include("MainWindow.jl")

include("init.jl")

function __init__()
	global debug = true
	global window = MainWindow()
	init!(window)

	if !isinteractive()
		c = Condition()
		signal_connect(window, :destroy) do widget
			notify(c)
		end
		wait(c)
	end
end

end
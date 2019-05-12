mutable struct View
	grid::GtkGrid

	function View(window::MainWindow)
		g = GtkGrid()
		n = new(g)
		push!(window, g)
		push!(window.views, g)
	end
end

function addElement(view::View, element, x::Int, y::Int)
	view.grid[x,y] = element
end
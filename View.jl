mutable struct View
	grid::GtkGrid

	function View()
		g = GtkGrid()
		n = new(g)
	end
end

function addElement(view::View, element, x::Int, y::Int)
	view.grid[x,y] = element
end
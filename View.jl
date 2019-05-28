mutable struct View
	grid::GtkGrid
	name::String
	builder::GtkBuilder

	function View(name::String, file::String)
		b = GtkBuilder(filename=file)
		n = new(b["grid"], name, b)
	end
end

function addElement(view::View, element, x::Int, y::Int)
	view.grid[x,y] = element
end

function getConlangView()
	conlangView = View("language", "forms/conlangView.glade")

	ipaTableId = signal_connect(ipaTable, conlangView.builder["ipaTableMi"], "activate")
	newLangId = signal_connect(newLanguage, conlangView.builder["newLangMi"], "activate")
	newLangWizardId = signal_connect(newLangWizard, conalangView.builder["nLWizard"], "activate")

	return conlangView
end

function getBlankView()
	blankView = View("blank", "forms/blank.glade")
	return blankView
end
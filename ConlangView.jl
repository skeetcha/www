function playSoundFile(widgetptr)
	name = get_gtk_property(widgetptr, :label, String)

	if debug
		println(string("Playing the sound file for ", name))
	end

	if name == "bilabial_nasal_unvoiced"
		# Play sound
	elseif name == "bilabial_nasal_voiced"
		# Play sound
	elseif name == "labiodental_nasal_voiced"
		# Play sound
	end
end

function setupIPATableSignals(builder::GtkBuilder)
	# Nasals
	voicelessBilabialNasalId = signal_connect(playSoundFile, builder["bilabial_nasal_unvoiced"], :clicked)
	voicedBilabialNasalId = signal_connect(voicedBilabialNasal, builder["bilabial_nasal_voiced"], :clicked)
	voicedLabiodentalNasalId = signal_connect(voicedLabiodentalNasal, builder["labiodental_nasal_voiced"], :clicked)
end

function ipaTable(widgetptr)
	if debug
		println("Opening IPA table...")
	end

	b = GtkBuidler(filename="forms/ipatable.glade")
	w = b["window"]

	setupIPATableSignals(b)

	showall(w)

	if !isinteractive()
		ipac = Condition()
		signal_connect(w, :destroy) do widget
			notify(ipac)
		end
		wait(ipac)
	end

	return nothing
end
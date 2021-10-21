function ResetGame()
	ActiveModifiers = {
		P1 = table.shallowcopy(PlayerDefaults),
		P2 = table.shallowcopy(PlayerDefaults),
		--EDIT = table.shallowcopy(PlayerDefaults),
		--Save values here if editing profile
	}
end

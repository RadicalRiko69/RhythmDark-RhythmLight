do
	--if there isn't music for a specific screen it falls back to common
	local music = {
		common = {
			["Dark"] = "_dark (loop).ogg";
			["Light"] = "_light (loop).ogg";
		};
		result = {
			["Dark"] = "valkyrie (loop).ogg";
			["Light"] = "purpose (loop).ogg";
		};
		value = {
			["Dark"] = "click.ogg";
			["Light"] = "key.wav";
		};
	}
	--thanks to this code
	for name,child in pairs(music) do
		if name ~= "common" then
			setmetatable(child, {__index=music.common})
		end
	end
	function GetMenuMusicPath(type, relative)
		local possibles = music[type] 
			or error("GetMenuMusicPath: unknown menu music type "..type, 2)
		local selection = ThemePrefs.Get("TeamPreference")
		local file = possibles[selection]
			or error("GetMenuMusicPath: no menu music defined for selection"..selection, 2)
		return relative and file or THEME:GetPathS("", file)
	end
end
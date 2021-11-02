-- Timerseconds for this screen is controlled by:
-- NextStageSleepTime+WallpaperSleepTime values in ScreenProfileSaveOverlay
-- Wallpaper transition system by ROAD24 and NeobeatIKK

local t = Def.ActorFrame{};

function getRandomWall()
-- Cortes quiere random wallpaper, este script cargara de forma aleatoria
--  una imagen dentro del folder _RandomWalls en BGAnimations
	local sImagesPath = THEME:GetPathB("","Wallpapers");
	if ThemePrefs.Get("TeamPreference") == "Dark" then
		sImagesPath = THEME:GetPathB("","Wallpapers/dark");
	elseif ThemePrefs.Get("TeamPreference") == "Light" then
		sImagesPath = THEME:GetPathB("","Wallpapers/light");
	end;
	local sRandomWalls = FILEMAN:GetDirListing(sImagesPath.."/",false,true);
	-- El random seed
	 math.randomseed(Hour()*3600+Second());
	return sRandomWalls[math.random(#sRandomWalls)];
end;


t[#t+1] = Def.ActorFrame{
	LoadActor(getRandomWall())..{
		InitCommand=cmd(Center;zoomto,854,480);
	};
};

local emblem = "";
	if ThemePrefs.Get("TeamPreference") == "Dark" then
		emblem = THEME:GetPathB("ScreenWithMenuElements","background/dark/spider");
	elseif ThemePrefs.Get("TeamPreference") == "Light" then
		emblem = THEME:GetPathB("ScreenWithMenuElements","background/light/badge");
end;

t[#t+1] = Def.ActorFrame{
	LoadActor(emblem)..{
		InitCommand=cmd(xy,SCREEN_RIGHT-100,SCREEN_BOTTOM-60;zoom,0.5);
	};
}

return t

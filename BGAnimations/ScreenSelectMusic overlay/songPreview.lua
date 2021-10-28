
local t = Def.ActorFrame {};
local FRAME = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  FRAME = "song frame"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  FRAME = "gold frame"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(FRAME);
};

local NAMES = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  NAMES = "song name"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  NAMES = "gold name"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(NAMES);
};

return t
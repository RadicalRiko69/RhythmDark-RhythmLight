local t = Def.ActorFrame{};

local LOAD = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  LOAD = "darkload"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  LOAD = "lightload"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(LOAD);
};

return t

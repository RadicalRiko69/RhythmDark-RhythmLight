local t = Def.ActorFrame{};

local COMBO = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  COMBO = "dark"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  COMBO = "light"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(COMBO);
};

return t

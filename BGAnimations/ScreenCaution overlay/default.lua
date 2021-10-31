local t = Def.ActorFrame {};

local WARNING = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  WARNING = "dark"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  WARNING = "light"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(WARNING);
};

return t

local t = Def.ActorFrame{};

local OUT = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  OUT = "dark"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  OUT = "light"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(OUT);
};

return t

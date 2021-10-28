local t = Def.ActorFrame{};

local NAME = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  NAME = "dark"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  NAME = "light"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(NAME);
};

return t

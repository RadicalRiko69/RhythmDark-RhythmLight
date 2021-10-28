local t = Def.ActorFrame{};

local logo = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  logo = "dark"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  logo = "light"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(logo);
};

return t

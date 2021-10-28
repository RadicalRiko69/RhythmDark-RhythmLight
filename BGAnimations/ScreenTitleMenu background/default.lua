local t = Def.ActorFrame{};

local BG = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  BG = "dark"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  BG = "light"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(BG);
};

return t

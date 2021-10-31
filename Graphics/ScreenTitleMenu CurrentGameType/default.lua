local t = Def.ActorFrame{};

local GAME = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  GAME = "dark"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  GAME = "light"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(GAME);
};

return t

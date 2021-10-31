local t = Def.ActorFrame {};

local FAIL = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  FAIL = "dark"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  FAIL = "light"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(FAIL);
};

return t

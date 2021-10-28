local t = Def.ActorFrame{};

local JUDGE = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  JUDGE = "dark"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  JUDGE = "light"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(JUDGE);
};

return t

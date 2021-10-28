local t = Def.ActorFrame{};

local LOAD = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  LOAD = "darkin"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  LOAD = "lightin"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(LOAD);
};

return t

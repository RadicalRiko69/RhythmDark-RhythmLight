local t = Def.ActorFrame{};

local SCROLL = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  SCROLL = "_darkscrolls"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  SCROLL = "_lightscrolls"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(SCROLL);
};

return t

local t = Def.ActorFrame {};

local FRAME = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  FRAME = "jacket frame"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  FRAME = "jacket gold"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(FRAME);
};

return t

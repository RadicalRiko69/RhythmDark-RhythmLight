local t = Def.ActorFrame{};

local BG = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  BG = "_dark"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  BG = "_light"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(BG);
};

return t

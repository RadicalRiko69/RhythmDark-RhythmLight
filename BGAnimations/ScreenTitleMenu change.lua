local t = Def.ActorFrame {}
--Sound effects
local SFX = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  SFX = "darkfx"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  SFX = "lightfx"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(SFX);
};
return t
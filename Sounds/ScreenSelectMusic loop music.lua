local t = Def.ActorFrame{};

local music = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  music = "_dark"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  music = "_light"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(music.." (loop).ogg");
  InitCommand=cmd(play);
};

return t

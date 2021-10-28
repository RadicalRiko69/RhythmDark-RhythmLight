local t = Def.ActorFrame{};

local TR = "";

if ThemePrefs.Get("TeamPreference") == "Dark" then
  TR = "dark"
elseif ThemePrefs.Get("TeamPreference") == "Light" then
  TR = "light"
end;

t[#t+1] = Def.ActorFrame{
  LoadActor(TR);
};

return t

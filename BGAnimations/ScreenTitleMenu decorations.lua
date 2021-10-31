InitUserPrefs();

local t = Def.ActorFrame {}

t[#t+1] = StandardDecorationFromFileOptional("Logo","Logo");
t[#t+1] = StandardDecorationFromFileOptional("CurrentGametype","CurrentGametype");

return t

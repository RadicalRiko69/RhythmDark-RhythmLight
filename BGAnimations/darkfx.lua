local t = Def.ActorFrame {}

--Sound effects
t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathS("","click"))..{
		GainFocusCommand=cmd(stop;play);
		DirectionButtonMessageCommand=cmd(play);
	};
};

return t

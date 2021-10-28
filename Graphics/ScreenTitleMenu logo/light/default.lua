local t = Def.ActorFrame{
	InitCommand=cmd(fov,70);
	LoadActor("glow")..{
		Name="TextGlow";
		InitCommand=cmd(zoom,0.25;diffusealpha,1);
		OnCommand=cmd(diffuseshift; effectoffset,0.5; effectperiod, 3; effectcolor1, 1,1,1,0; effectcolor2, 1,1,1,1);
	};
	LoadActor("Rhythm Light")..{
		Name="Text";
		InitCommand=cmd(zoom,0.25);
	};
};

return t;

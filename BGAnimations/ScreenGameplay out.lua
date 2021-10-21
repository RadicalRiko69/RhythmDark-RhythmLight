local bg = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,0"));
		OnCommand=cmd(sleep,5;linear,2;diffusealpha,0);
	};
	LoadActor(THEME:GetPathS("","gameplay/out"))..{
		OnCommand=cmd(sleep,5;queuecommand,"PlaySound");
		PlaySoundCommand=cmd(play);
	};
};

return bg
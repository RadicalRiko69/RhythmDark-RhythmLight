local bg = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,0"));
		OnCommand=cmd(sleep,8;linear,2;diffusealpha,1);
	};
	LoadActor("ring")..{
		InitCommand=cmd(xy,SCREEN_RIGHT-170,SCREEN_BOTTOM-10;zoom,0.5;rotationy,40;rotationx,-50;diffusealpha,0;spin;effectmagnitude, 0,0,-200;effectperiod,100);
		OffCommand=cmd(sleep,4;decelerate,0.5;addy,-20;diffusealpha,1);
	};
	LoadFont("_chiaro 36px")..{	
		InitCommand=cmd(xy,SCREEN_RIGHT-90,SCREEN_BOTTOM-15;zoom,0.85;diffusealpha,0;skewx,-0.2);
		OffCommand=cmd(sleep,4;decelerate,0.5;addy,-20;diffusealpha,1);
		Text="LOADING...";
	};
};

return bg
local t = Def.ActorFrame {};
t[#t+1] = Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,0"));
		OnCommand=cmd(diffusealpha,1;linear,0.5;diffusealpha,0);	
};

t[#t+1] = LoadActor("ring")..{
	InitCommand=cmd(xy,SCREEN_RIGHT-170,SCREEN_BOTTOM-30;zoom,0.5;rotationy,40;rotationx,-50;diffusealpha,1;spin;effectmagnitude, 0,0,-400;effectperiod,100);
	OnCommand=cmd(decelerate,0.5;zoom,1;diffusealpha,0);
};

t[#t+1] = LoadFont("_chiaro 36px")..{	
	InitCommand=cmd(xy,SCREEN_RIGHT-90,SCREEN_BOTTOM-30;zoom,0.8;diffusealpha,1;skewx,-0.2);
	OnCommand=cmd(decelerate,0.5;zoomx,2;zoomy,0;diffusealpha,0);
	Text="LOADING...";
};

return t;
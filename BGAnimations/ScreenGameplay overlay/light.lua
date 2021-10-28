local bg = Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;zoom,1);
		StartTransitioningCommand=cmd(linear,0.25;diffusealpha,1);
		Def.Quad {
			InitCommand=cmd(Center;zoomto,SCREEN_WIDTH*500,SCREEN_HEIGHT*500;diffuse,Color("White");linear,1;diffusealpha,1);
		};
	};
};

return bg
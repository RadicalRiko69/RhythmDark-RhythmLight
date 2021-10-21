local t = Def.ActorFrame{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,1;zoom,1);
	Def.Quad {
		InitCommand=cmd(Center;zoomto,SCREEN_WIDTH*500,SCREEN_HEIGHT*500;diffuse,Color("Black");sleep,0.01;linear,1;diffusealpha,1);
	};
	  Def.ActorFrame {
		  LoadActor(THEME:GetPathB("ScreenSelectMusic","overlay/out/scan")) .. {
			OnCommand=cmd(zoom,0.7;x,SCREEN_CENTER_X-220;y,SCREEN_CENTER_Y-500;diffusealpha,1;linear,5;y,SCREEN_CENTER_Y+100;queuecommand,"On");
		  };
		  LoadActor(THEME:GetPathB("ScreenSelectMusic","overlay/out/fence")) .. {
			OnCommand=cmd(zoom,0.25;x,SCREEN_CENTER_X-440;y,SCREEN_CENTER_Y-240;diffusealpha,0.25);
		  };
	  };
};

return t;

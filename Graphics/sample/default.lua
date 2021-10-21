
local t = Def.ActorFrame {};

t[#t+1] = Def.Quad {
	InitCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,Color("Black"));
};

t[#t+1] = Def.ActorFrame {
	OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,1;zoom,1);
	LoadActor("bluepink") .. {
	  OnCommand=cmd(zoom,1;x,SCREEN_CENTER_X-440;y,SCREEN_CENTER_Y-240;diffusealpha,0.05);
	};
	LoadActor("fence") .. {
		OnCommand=cmd(zoom,0.25;x,SCREEN_CENTER_X-440;y,SCREEN_CENTER_Y-240;MaskSource;diffusealpha,0.25);
	};
	LoadActor("scan") .. {
		OnCommand=cmd(zoom,0.7;x,SCREEN_CENTER_X-200;y,SCREEN_CENTER_Y-550;blend,Blend.Add;MaskDest;diffusealpha,1;queuecommand,"Loop");
		LoopCommand=cmd(linear,2;addy,1200;diffusealpha,0;queuecommand,"On");
	  };
	LoadActor("fence") .. {
		OnCommand=cmd(zoom,0.25;x,SCREEN_CENTER_X-440;y,SCREEN_CENTER_Y-240;diffusealpha,0.25);
	};
	LoadActor("fade") .. {
		OnCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;x,SCREEN_CENTER_X-427;y,SCREEN_CENTER_Y-220;diffusealpha,0.95);
	};
  };

return t;

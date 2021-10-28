local t = Def.ActorFrame {};
InitCommand=cmd(Center);
t[#t+1] = Def.ActorFrame {
  FOV=120;
  InitCommand=cmd(Center);
	Def.ActorFrame{
		LoadActor("background-color")..{
			OnCommand=cmd(zoom,2;spin;effectmagnitude, 0,0,-10;effectperiod,10)
		};
	};
	Def.ActorFrame{
		LoadActor("background-color")..{
			OnCommand=cmd(zoom,2;diffusealpha,0.1;spin;effectmagnitude, 0,0,-200;effectperiod,10)
		};
	};
	Def.ActorFrame{
		LoadActor("background-color")..{
			OnCommand=cmd(zoom,2;diffusealpha,0.5;spin;effectmagnitude, 0,0,-30;effectperiod,10)
		};
	};
};

t[#t+1] = Def.ActorFrame {
	FOV=120;
	InitCommand=cmd(Center;spin;effectmagnitude, 0,0,20);
	  Def.ActorFrame {
		  LoadActor("_checkerboard") .. {
			  InitCommand=cmd(y,SCREEN_CENTER_Y+100;rotationy,-30;rotationz,180;rotationx,90/4*3.5;zoomto,SCREEN_WIDTH*4,SCREEN_HEIGHT*2;customtexturerect,0,0,SCREEN_WIDTH*4/256,SCREEN_HEIGHT*4/256);
			  OnCommand=cmd(texcoordvelocity,0,-1;fadetop,2);
		  };
	  };
	  Def.ActorFrame {
		  LoadActor("_checkerboard") .. {
			  InitCommand=cmd(y,SCREEN_CENTER_Y-750;rotationy,-30;rotationz,180;rotationx,90/4*3.5;zoomto,SCREEN_WIDTH*4,SCREEN_HEIGHT*2;customtexturerect,0,0,SCREEN_WIDTH*4/256,SCREEN_HEIGHT*4/256);
			  OnCommand=cmd(texcoordvelocity,0,-1;fadetop,2);
		  };
	  };
  };

return t
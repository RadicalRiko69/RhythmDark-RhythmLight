local t = Def.ActorFrame {};
InitCommand=cmd(Center);
t[#t+1] = Def.ActorFrame {
  FOV=120;
  InitCommand=cmd(Center);
	Def.ActorFrame{
		LoadActor("background-grey")..{
			OnCommand=cmd(zoom,2;spin;effectmagnitude, 0,0,100;effectperiod,10)
		};
	};
	Def.ActorFrame{
		LoadActor("background-color")..{
			OnCommand=cmd(zoom,2;spin;blend,Blend.Add;effectmagnitude, 0,0,-10;effectperiod,10)
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
		  LoadActor("clouds") .. {
			  InitCommand=cmd(y,SCREEN_CENTER_Y+100;rotationy,-30;rotationz,180;rotationx,90/4*3.5;zoomto,SCREEN_WIDTH*4,SCREEN_HEIGHT*2;customtexturerect,0,0,SCREEN_WIDTH*4/256,SCREEN_HEIGHT*4/256);
			  OnCommand=cmd(texcoordvelocity,0,-1;fadetop,2);
		  };
	  };
	  Def.ActorFrame {
		  LoadActor("clouds") .. {
			  InitCommand=cmd(y,SCREEN_CENTER_Y-750;rotationy,-30;rotationz,180;rotationx,90/4*3.5;zoomto,SCREEN_WIDTH*4,SCREEN_HEIGHT*2;customtexturerect,0,0,SCREEN_WIDTH*4/256,SCREEN_HEIGHT*4/256);
			  OnCommand=cmd(texcoordvelocity,0,-1;fadetop,2);
		  };
	  };
  };
--FEATHERS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
t[#t+1] = Def.ActorFrame {
	FOV=120;
	InitCommand=cmd(Center;spin;effectmagnitude, 90,40,20);
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(x,400;rotationz,180;zoom,0.3);
		};
	};
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(x,-400;rotationz,0;zoom,0.3);
		};
	};
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(xy,-400,400;rotationz,0;zoom,0.3);
		};
	};
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(xy,400,-400;rotationz,90;zoom,0.3);
		};
	};
  };
t[#t+1] = Def.ActorFrame {
	FOV=120;
	InitCommand=cmd(Center;rotationz,90;spin;effectmagnitude, 90,40,20);
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(x,400;rotationz,180;zoom,0.3);
		};
	};
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(x,-400;rotationz,0;zoom,0.3);
		};
	};
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(xy,-400,400;rotationz,0;zoom,0.3);
		};
	};
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(xy,400,-400;rotationz,90;zoom,0.3);
		};
	};
  };
t[#t+1] = Def.ActorFrame {
	FOV=120;
	InitCommand=cmd(Center;rotationz,90;rotationy,180;spin;effectmagnitude, 90,40,20);
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(x,400;rotationz,180;zoom,0.3);
		};
	};
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(x,-400;rotationz,0;zoom,0.3);
		};
	};
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(xy,-400,400;rotationz,0;zoom,0.3);
		};
	};
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(xy,400,-400;rotationz,90;zoom,0.3);
		};
	};
  };
t[#t+1] = Def.ActorFrame {
	FOV=120;
	InitCommand=cmd(Center;rotationz,0;rotationy,-180;spin;effectmagnitude, 90,40,20);
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(x,400;rotationz,180;zoom,0.3);
		};
	};
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(x,-400;rotationz,0;zoom,0.3);
		};
	};
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(xy,-400,400;rotationz,0;zoom,0.3);
		};
	};
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(xy,400,-400;rotationz,90;zoom,0.3);
		};
	};
  };
t[#t+1] = Def.ActorFrame {
	FOV=120;
	InitCommand=cmd(Center;rotationz,90;rotationx,180;spin;effectmagnitude, 90,40,20);
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(x,400;rotationz,180;zoom,0.3);
		};
	};
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(x,-400;rotationz,0;zoom,0.3);
		};
	};
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(xy,-400,400;rotationz,0;zoom,0.3);
		};
	};
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(xy,400,-400;rotationz,90;zoom,0.3);
		};
	};
  };
t[#t+1] = Def.ActorFrame {
	FOV=120;
	InitCommand=cmd(Center;rotationz,0;rotationx,-180;spin;effectmagnitude, 90,40,20);
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(x,400;rotationz,180;zoom,0.3);
		};
	};
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(x,-400;rotationz,0;zoom,0.3);
		};
	};
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(xy,-400,400;rotationz,0;zoom,0.3);
		};
	};
	Def.ActorFrame {
		LoadActor("feather") .. {
		  InitCommand=cmd(xy,400,-400;rotationz,90;zoom,0.3);
		};
	};
  };
--Okay, that's enough feathers.
t[#t+1] = Def.ActorFrame {
	OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;queuecommand,"Loop");
	LoopCommand=cmd(linear,2;diffusealpha,1;linear,2;diffusealpha,0;queuecommand,"Loop");
	LoadActor("badge") .. {
		OnCommand=cmd(diffusealpha,1;zoom,0.8);
	};
  };
return t
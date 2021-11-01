local t = Def.ActorFrame {};


t[#t+1] = Def.ActorFrame {
	FOV=120;
	InitCommand=cmd(Center);
	  Def.ActorFrame {
		  LoadActor("_checkerboard") .. {
			  InitCommand=cmd(y,SCREEN_CENTER_Y+100;rotationz,90;zoomto,SCREEN_WIDTH*2,SCREEN_HEIGHT*2;customtexturerect,0,0,SCREEN_WIDTH*4/256,SCREEN_HEIGHT*4/256);
			  OnCommand=cmd(texcoordvelocity,0,-1;diffusealpha,0.25;fadetop,2);
		  };
	  };
	  Def.ActorFrame {
		  LoadActor("_checkerboard") .. {
			  InitCommand=cmd(y,SCREEN_CENTER_Y-750;;rotationz,-90;zoomto,SCREEN_WIDTH*2,SCREEN_HEIGHT*2;customtexturerect,0,0,SCREEN_WIDTH*4/256,SCREEN_HEIGHT*4/256);
			  OnCommand=cmd(texcoordvelocity,0,-1;diffusealpha,0.25;fadetop,2);
		  };
	  };
  };

t[#t+1] = Def.ActorFrame {
	OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;queuecommand,"Loop");
	LoopCommand=cmd(linear,2;diffusealpha,1;linear,2;diffusealpha,0;queuecommand,"Loop");
	LoadActor("spider") .. {
		OnCommand=cmd(diffusealpha,1;zoom,0.8);
	};
  };

t[#t+1] = Def.ActorFrame {
	FOV=120;
	InitCommand=cmd(Center);
	  Def.ActorFrame {
		  LoadActor("fade") .. {
			  InitCommand=cmd(y,SCREEN_CENTER_Y+100;x,SCREEN_CENTER_X;zoomto,SCREEN_WIDTH*2,SCREEN_HEIGHT*2);
		  };
	  };
	  LoadActor("scan") .. {
			OnCommand=cmd(zoom,0.7;x,SCREEN_CENTER_X-1000;y,SCREEN_CENTER_Y;rotationz,90;blend,Blend.Add;diffusealpha,1;queuecommand,"Loop");
			LoopCommand=cmd(linear,4;addx,2200;diffusealpha,0;queuecommand,"On");
	  };
	  LoadActor("scan") .. {
			OnCommand=cmd(zoom,0.7;x,SCREEN_CENTER_X+1000;y,SCREEN_CENTER_Y;rotationz,-90;blend,Blend.Add;diffusealpha,1;sleep,0.2;queuecommand,"Loop");
			LoopCommand=cmd(linear,4;addx,-2200;diffusealpha,0;queuecommand,"On");
	  };
  };

t[#t+1] = Def.ActorFrame {
  FOV=120;
  InitCommand=cmd(Center;z,200;spin;effectmagnitude,20,10,50;zoom,0.6);
	Def.ActorFrame{
		LoadActor("ring") .. {
			OnCommand=cmd(zoom,0.2;diffusealpha,0.5;spin;effectmagnitude, 0,0,-30)
		};
	};
	Def.ActorFrame{
		LoadActor("lined") .. {
			OnCommand=cmd(zoom,0.2;diffusealpha,0.5;spin;effectmagnitude, -40,10,-20)
		};
	};
	Def.ActorFrame{
		LoadActor("lined") .. {
			OnCommand=cmd(zoom,0.9;diffusealpha,0.5;spin;effectmagnitude, 10,80,-50)
		};
	};
};
return t
local bg = Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;zoom,1);
		StartTransitioningCommand=cmd(linear,0.25;diffusealpha,1);
		Def.Quad {
			InitCommand=cmd(Center;zoomto,SCREEN_WIDTH*500,SCREEN_HEIGHT*500;diffuse,Color("Black");linear,1;diffusealpha,1);
		};
		  Def.ActorFrame {
			  LoadActor(THEME:GetPathB("ScreenSelectMusic","overlay/out/scan")) .. {
				OnCommand=cmd(zoom,0.7;x,SCREEN_CENTER_X-220;y,SCREEN_CENTER_Y-500;diffusealpha,1;linear,1;y,SCREEN_CENTER_Y+100);
			  };
			  LoadActor(THEME:GetPathB("ScreenSelectMusic","overlay/out/fence")) .. {
				OnCommand=cmd(zoom,0.25;x,SCREEN_CENTER_X-440;y,SCREEN_CENTER_Y-240;diffusealpha,0.25);
			  };
		  };
	};
	--ARMY OF LIGHTS
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X);
			self:y(SCREEN_CENTER_Y);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/shiny"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X);
			self:y(SCREEN_CENTER_Y+300);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/shiny"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X);
			self:y(SCREEN_CENTER_Y-300);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/shiny"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-303);
			self:y(SCREEN_CENTER_Y);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/shiny"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+303);
			self:y(SCREEN_CENTER_Y);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/shiny"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-151.5);
			self:y(SCREEN_CENTER_Y+150);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/shiny"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-455);
			self:y(SCREEN_CENTER_Y+150);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/shiny"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+455);
			self:y(SCREEN_CENTER_Y+150);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/shiny"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-455);
			self:y(SCREEN_CENTER_Y-150);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/shiny"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+455);
			self:y(SCREEN_CENTER_Y-150);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/shiny"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+151.5);
			self:y(SCREEN_CENTER_Y-150);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/shiny"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-151.5);
			self:y(SCREEN_CENTER_Y-150);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/shiny"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+151.5);
			self:y(SCREEN_CENTER_Y+150);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/shiny"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-303);
			self:y(SCREEN_CENTER_Y-300);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/shiny"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+303);
			self:y(SCREEN_CENTER_Y+300);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/shiny"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-303);
			self:y(SCREEN_CENTER_Y+300);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/shiny"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+303);
			self:y(SCREEN_CENTER_Y-300);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/shiny"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	--ARMY OF FRAMES
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X);
			self:y(SCREEN_CENTER_Y);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/square"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X);
			self:y(SCREEN_CENTER_Y+300);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/square"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X);
			self:y(SCREEN_CENTER_Y-300);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/square"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-303);
			self:y(SCREEN_CENTER_Y);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/square"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+303);
			self:y(SCREEN_CENTER_Y);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/square"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-151.5);
			self:y(SCREEN_CENTER_Y+150);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/square"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-455);
			self:y(SCREEN_CENTER_Y+150);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/square"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+455);
			self:y(SCREEN_CENTER_Y+150);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/square"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-455);
			self:y(SCREEN_CENTER_Y-150);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/square"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+455);
			self:y(SCREEN_CENTER_Y-150);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/square"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+151.5);
			self:y(SCREEN_CENTER_Y-150);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/square"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-151.5);
			self:y(SCREEN_CENTER_Y-150);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/square"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+151.5);
			self:y(SCREEN_CENTER_Y+150);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/square"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-303);
			self:y(SCREEN_CENTER_Y-300);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/square"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+303);
			self:y(SCREEN_CENTER_Y+300);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/square"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-303);
			self:y(SCREEN_CENTER_Y+300);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/square"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+303);
			self:y(SCREEN_CENTER_Y-300);
			self:zoom(0);
		end;
		StartTransitioningCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/square"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","background/dark/spider"))..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X);
			self:y(SCREEN_CENTER_Y);
			self:diffusealpha(0);
			self:zoom(1);
		end;
		StartTransitioningCommand = function(self)
			self:decelerate(0.25);
			self:zoom(0.5);
			self:diffusealpha(1);
		end;
	};
};

return bg
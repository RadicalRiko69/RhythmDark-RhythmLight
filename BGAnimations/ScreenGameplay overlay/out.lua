local bg = Def.ActorFrame{
	Def.Quad {
		OffCommand=cmd(Center;zoomto,SCREEN_WIDTH*500,SCREEN_HEIGHT*500;diffuse,Color("Black");linear,0.25;diffusealpha,1);
	};
	Def.ActorFrame {
		LoadActor(THEME:GetPathB("ScreenSelectMusic","overlay/out/scan")) .. {
		  OnCommand=cmd(zoom,0.7;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-500;diffusealpha,0);
		  OffCommand=cmd(linear,0.25;diffusealpha,1;linear,1;y,SCREEN_CENTER_Y+500);
		};
		LoadActor(THEME:GetPathB("ScreenSelectMusic","overlay/out/fence")) .. {
		  OnCommand=cmd(zoom,0.25;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0);
		  OffCommand=cmd(linear,0.25;diffusealpha,0.25);
		};
	};
	--ARMY OF LIGHTS
	Def.Sprite{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X);
			self:y(SCREEN_CENTER_Y);
			self:zoom(0);
		end;
		OffCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/light"));
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
		OffCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/light"));
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
		OffCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/light"));
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
		OffCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/light"));
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
		OffCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/light"));
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
		OffCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/light"));
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
		OffCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/light"));
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
		OffCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/light"));
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
		OffCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/light"));
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
		OffCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/light"));
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
		OffCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/light"));
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
		OffCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/light"));
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
		OffCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/light"));
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
		OffCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/light"));
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
		OffCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/light"));
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
		OffCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/light"));
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
		OffCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/light"));
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
		OffCommand = function(self)
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
		OffCommand = function(self)
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
		OffCommand = function(self)
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
		OffCommand = function(self)
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
		OffCommand = function(self)
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
		OffCommand = function(self)
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
		OffCommand = function(self)
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
		OffCommand = function(self)
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
		OffCommand = function(self)
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
		OffCommand = function(self)
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
		OffCommand = function(self)
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
		OffCommand = function(self)
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
		OffCommand = function(self)
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
		OffCommand = function(self)
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
		OffCommand = function(self)
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
		OffCommand = function(self)
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
		OffCommand = function(self)
				self:Load(THEME:GetPathB("ScreenWithMenuElements","out/square"));
				self:decelerate(0.25);
				self:zoom(0.3);
		end;
	};
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","background/emblem"))..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X);
			self:y(SCREEN_CENTER_Y);
			self:diffusealpha(0);
			self:zoom(1);
		end;
		OffCommand = function(self)
			self:decelerate(0.25);
			self:zoom(0.15);
			self:diffusealpha(1);
		end;
	};
};

return bg
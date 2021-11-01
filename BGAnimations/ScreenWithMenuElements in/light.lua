local bg = Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,1;zoom,1);
		OnCommand=cmd(linear,0.5;diffusealpha,0);
		Def.Quad {
			InitCommand=cmd(Center;zoomto,SCREEN_WIDTH*500,SCREEN_HEIGHT*500;diffuse,Color("White");linear,1;diffusealpha,1);
		};
	};
	Def.ActorFrame {
		FOV=120;
		InitCommand=cmd(Center;zoom,0.35;rotationz,0);
		OnCommand=cmd(decelerate,1;zoom,1.5;rotationz,360);
			LoadActor(THEME:GetPathB("ScreenWithMenuElements","background/light/feather")) .. {
			  InitCommand=cmd(xy,0,400;rotationz,0;zoom,0.5);
			};
			LoadActor(THEME:GetPathB("ScreenWithMenuElements","background/light/feather")) .. {
			  InitCommand=cmd(xy,0,-400;rotationz,180;zoom,0.5);
			};
			LoadActor(THEME:GetPathB("ScreenWithMenuElements","background/light/feather")) .. {
			  InitCommand=cmd(xy,-400,0;rotationz,90;zoom,0.5);
			};
			LoadActor(THEME:GetPathB("ScreenWithMenuElements","background/light/feather")) .. {
			  InitCommand=cmd(xy,400,0;rotationz,-90;zoom,0.5);
			};
		};
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","background/light/badge"))..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X);
			self:y(SCREEN_CENTER_Y);
			self:zoom(0.5);
		end;
		StartTransitioningCommand = function(self)
			self:decelerate(0.5);
			self:zoom(0);
			self:diffusealpha(0);
		end;
	};
	LoadActor(THEME:GetPathS("","gameplay/Light/in"))..{
		OnCommand=function(self)
			self:play();
		end;
	};
};

return bg
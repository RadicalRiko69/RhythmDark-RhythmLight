local bg = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,0"));
		OnCommand=cmd(decelerate,0.25;diffusealpha,0.8;sleep,4.666;linear,0.5;diffusealpha,0);
	};
	LoadActor("death")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+150;zoom,0.3;diffusealpha,0);
		OnCommand = function(self)
				self:decelerate(0.1);
				self:y(SCREEN_CENTER_Y+10);
				self:diffusealpha(1);
				self:decelerate(5);
				self:y(SCREEN_CENTER_Y);
				self:diffusealpha(0);
		end;
	};
	LoadActor(THEME:GetPathS("","gameplay/deathblow"))..{
		StartTransitioningCommand = function(self)
				self:play();
		end;
	};
	LoadActor(THEME:GetPathB("ScreenGameplay","out"))..{
		OnCommand=function(self)
			self:draworder(9999);
		end;
	};
};

return bg
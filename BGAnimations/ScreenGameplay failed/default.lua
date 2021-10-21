local bg = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,0"));
		OnCommand=cmd(decelerate,0.25;diffusealpha,0.8;sleep,4.666;linear,0.5;diffusealpha,0);
	};
	LoadActor("failure")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,1;diffusealpha,0);
		OnCommand = function(self)
				self:decelerate(0.5);
				self:zoom(0.3);
				self:diffusealpha(1);
				self:sleep(1);
				self:decelerate(0.5);
				self:diffusealpha(0);
		end;
	};
	LoadActor(THEME:GetPathS("","gameplay/failure"))..{
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
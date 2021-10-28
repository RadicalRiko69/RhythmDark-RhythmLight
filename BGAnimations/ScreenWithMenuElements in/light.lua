local bg = Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,1;zoom,1);
		OnCommand=cmd(linear,0.25;diffusealpha,0);
		Def.Quad {
			InitCommand=cmd(Center;zoomto,SCREEN_WIDTH*500,SCREEN_HEIGHT*500;diffuse,Color("White");linear,1;diffusealpha,1);
		};
	};
	LoadActor(THEME:GetPathS("","gameplay/Light/in"))..{
		OnCommand=function(self)
			self:play();
		end;
	};
};

return bg
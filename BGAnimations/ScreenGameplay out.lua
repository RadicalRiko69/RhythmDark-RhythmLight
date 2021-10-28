local t = Def.ActorFrame {};
t[#t+1] = Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,0"));
		OnCommand=cmd(diffusealpha,0;hibernate,5);	
};

t[#t+1] = LoadActor(THEME:GetPathB("ScreenGameplay","overlay/out"))..{
	OffCommand=function(self)
		self:hibernate(5);
	end;
};

t[#t+1] = Def.Sound{
	OnCommand=cmd(sleep,5;queuecommand,"Play");
	PlayCommand=function(self)
	  if ThemePrefs.Get("TeamPreference") == "Dark" then
		self:load(THEME:GetPathS("","gameplay/Dark/out"));
		self:play();
	  elseif ThemePrefs.Get("TeamPreference") == "Light" then
		self:load(THEME:GetPathS("","gameplay/Light/out"));
		self:play();
	  end;
	end;
};

return t;
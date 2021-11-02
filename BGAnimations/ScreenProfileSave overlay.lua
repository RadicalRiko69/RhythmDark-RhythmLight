local x = Def.ActorFrame{
	LoadFont("Common Normal")..{
		Text=ScreenString("Saving Profiles");
		InitCommand=cmd(Center;diffusealpha,0;shadowlength,1);
	};
};

x[#x+1] = Def.Actor {
	BeginCommand=function(self)
		if SCREENMAN:GetTopScreen():HaveProfileToSave() then self:sleep(3); end;
		self:queuecommand("Load");
	end;
	LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
};

return x;
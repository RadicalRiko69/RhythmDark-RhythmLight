local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  FOV=120;
  InitCommand=cmd(Center);
	LoadActor("no pay mode")..{
		InitCommand=cmd(zoom,0.445);
	};
};

return t
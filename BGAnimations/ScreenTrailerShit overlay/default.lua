local t = Def.ActorFrame{};

--[[t[#t+1] = Def.ActorFrame{
  LoadActor(THEME:GetPathG("ScreenTitleMenu","logo"));
  InitCommand=cmd(Center;diffusealpha,0;zoom,2;sleep,1;decelerate,1;diffusealpha,1;zoom,1);
};

t[#t+1] = Def.ActorFrame{
  LoadActor(THEME:GetPathG("ScreenTitleMenu","logo"));
  InitCommand=cmd(Center;diffusealpha,0;zoom,1;sleep,3;diffusealpha,1;decelerate,1;zoom,2;diffusealpha,0);
};

t[#t+1] = LoadFont("_chiaro 36px") .. {
  Text="A new theme for StepMania 5!";
  InitCommand=cmd(Center;strokecolor,Color("Black");addy,200;diffusealpha,0;zoom,1;sleep,5;decelerate,1;diffusealpha,1);
};--]]

return t

return Def.ActorFrame {
  InitCommand=function(self)
		--Reset the vars, player options, etc here.
		ResetGame();
	end;
  Def.Sprite{
        Name= "team",
        InitCommand=cmd(zoom,0.6);
        OnCommand= cmd(zoom,0.25;x,SCREEN_CENTER_X-30;y,SCREEN_CENTER_Y-400;sleep,1;linear,0.1;addy,370;sleep,0.05;addy,-1;sleep,0.05;addy,1;sleep,2;linear,0.5;diffusealpha,0),
        Texture= "team.png",
      },
  Def.Sprite{
        Name= "sushi",
        OnCommand= cmd(zoom,0.25;x,SCREEN_CENTER_X+30;y,SCREEN_CENTER_Y+400;sleep,1;linear,0.1;addy,-370;sleep,0.05;addy,1;sleep,0.05;addy,-1;sleep,2;linear,0.5;diffusealpha,0),
        Texture= "sushi.png",
      },
  Def.Sprite{
        Name= "presentations",
        OnCommand= cmd(zoom,0.3;diffusealpha,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+80;sleep,1;linear,1;diffusealpha,1;sleep,1.1;linear,0.5;diffusealpha,0),
        Texture= "presentations.png",
      },
  Def.Sprite{
        Name= "presents",
        OnCommand= cmd(zoom,0.52;diffusealpha,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,5;linear,1;diffusealpha,1;sleep,2;linear,0.5;diffusealpha,0),
        Texture= "presents.png",
      },
  Def.Sprite{
        Name= "sushi violation exceed war",
        OnCommand= cmd(zoom,0.52;diffusealpha,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,8.5;linear,1;diffusealpha,1;sleep,4;linear,0.5;diffusealpha,0),
        Texture= "svew.png",
      },
};

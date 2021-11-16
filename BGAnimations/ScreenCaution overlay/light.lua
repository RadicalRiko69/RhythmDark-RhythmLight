local t = Def.ActorFrame {};
-- Fade
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(Center);	
	Def.Quad {
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,Color.Black;diffusealpha,0;linear,0.5;diffusealpha,0.85);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
	};
};
-- Mascot
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(Center);
	Def.ActorFrame {
		LoadActor("heaven") .. {
			OnCommand=cmd(zoom,0.4);
		};
	};
};
-- Header
t[#t+1] = Def.ActorFrame {
	LoadFont("_chiaro 36px") .. {
		Text=Screen.String("Caution");
		OnCommand=cmd(skewx,-0.125;x,SCREEN_CENTER_X;y,SCREEN_TOP+20;diffuse,color("#ff0000");strokecolor,ColorDarkTone(color("#5f0000")));
	};
};
-- Disclaimer
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(Center);
	LoadFont("_chiaro 36px") .. {
		Text=Screen.String("CautionText");
		InitCommand=cmd(y,128);
		OnCommand=cmd(strokecolor,color("0,0,0,0.5");shadowlength,1;wrapwidthpixels,SCREEN_WIDTH-80);
	};
};
-- Cppyright
t[#t+1] = Def.ActorFrame {
	LoadFont("_chiaro 36px") .. {
		Text="Illustration by @pureisi\nCopyright by Team Sushi Presentations";
		InitCommand=cmd(x,SCREEN_RIGHT-20;y,SCREEN_BOTTOM-20;horizalign,right);
		OnCommand=cmd(strokecolor,Color("Black");zoom,0.4);
	};
};
return t

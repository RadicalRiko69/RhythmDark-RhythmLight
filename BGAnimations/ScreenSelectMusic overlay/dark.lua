local t = Def.ActorFrame {};

--[[Boss Stuff
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(draworder,-80);
	CurrentSongChangedMessageCommand=cmd(diffusealpha,0;y,50;decelerate,0.055;y,0;diffusealpha,1);
	LoadActor(THEME:GetPathG("","_live2d/grace_ver6/back"))..{
		OnCommand=cmd(Center;addy,-50;zoom,0.5;blend,Blend.Modulate);
	};
	LoadActor(THEME:GetPathG("","_live2d/grace_ver6/grace"))..{
		OnCommand=cmd(Center;addy,-50;zoom,0.5;blend,Blend.Add);
	};
};--]]

t[#t+1] = Def.ActorFrame{
	LoadActor("cursor")..{
		InitCommand=cmd(zoom,4;rotationz,180;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+120;sleep,1;linear,1;rotationz,45;zoom,0.25);
		OnCommand=cmd(pulse;effectmagnitude,0.85,0.9,0;effectperiod,1;effectclock,("beatnooffset"));
		OffCommand=cmd(linear,2;zoom,4;rotationz,720,y,SCREEN_CENTER_Y-120);
	};
};

t[#t+1] = Def.Quad {
	OnCommand=cmd(diffusealpha,0);
	SongChosenMessageCommand=cmd(decelerate,0.08;diffusealpha,0.75);
	SongUnchosenMessageCommand=cmd(decelerate,0.08;diffusealpha,0);
	InitCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,Color("Black");diffusealpha,0.75);
};

t[#t+1] = Def.ActorFrame{
	LoadActor("songPreview")..{
		InitCommand=cmd(zoomx,0.425;zoomy,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(sleep,0.5;decelerate,0.5;zoomy,0.425);
		OffCommand=cmd(decelerate,0.5;addy,700);
	};
};

t[#t+1] = Def.ActorFrame{
	LoadFont("_enigmatic unicode 20px")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-30;zoom,0.8;diffusealpha,0;shadowlength,2;sleep,2;decelerate,1;diffusealpha,1);
		OnCommand=function(self)
			if IsGame("pump") then
				self:settext("Select - DOWN LEFT/DOWN RIGHT/&LEFT;/&RIGHT;\nConfirm - CENTER/&START;");
			else
				self:settext("Select - LEFT/RIGHT/&LEFT;/&RIGHT;\nConfirm - ENTER/&START;");
			end
		end;
		SongChosenMessageCommand=function(self)
			if IsGame("pump") then
				self:settext("Select - DOWN LEFT/DOWN RIGHT/&LEFT;/&RIGHT;\nConfirm - CENTER/&START;    Cancel - UP LEFT/UP RIGHT/&UP;/&DOWN;");
			else
				self:settext("Select - LEFT/RIGHT/&LEFT;/&RIGHT;\nConfirm - ENTER/&START;    Cancel - UP/DOWN/&UP;/&DOWN;");
			end
		end;
		SongUnchosenMessageCommand=cmd(queuecommand,"On");
		OffCommand=cmd(decelerate,0.5;zoomy,0);
	};
	LoadFont("_enigmatic unicode 20px")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+30;zoom,1;diffusealpha,0;shadowlength,2;sleep,2;decelerate,1;diffusealpha,1);
		OnCommand=function(self)
			self:settext("Select Music");
		end;
		SongChosenMessageCommand=function(self)
			self:settext("Select Level");
		end;
		SongUnchosenMessageCommand=function(self)
			self:queuecommand("On");
		end;
		OffCommand=cmd(decelerate,0.5;zoomy,0);
	};
	LoadFont("_enigmatic unicode 20px")..{
		Text="Use your keyboard or dance pad to navigate the menu and choose a song to play.";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+10;zoom,0.5;diffusealpha,0;shadowlength,2);
		OnCommand=cmd(sleep,2;decelerate,1;diffusealpha,1);
		OffCommand=cmd(decelerate,0.5;zoomy,0);
	};
};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(addx,-224.5);
	OffCommand=cmd(decelerate,0.5;addy,700);
	LoadActor("jacket back")..{
		InitCommand=cmd(zoom,0.205;x,SCREEN_CENTER_X-300;y,SCREEN_CENTER_Y;diffusealpha,0);
		OnCommand=cmd(decelerate,1;diffusealpha,1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,-25);
		CurrentSongChangedMessageCommand=cmd(addx,-100;diffusealpha,0;rotationz,90;decelerate,0.05;rotationz,-25;addx,100;diffusealpha,1);
	};
};

if not GAMESTATE:IsCourseMode() then
	local function JacketUpdate(self)
		local song = GAMESTATE:GetCurrentSong();
		local Jacket = self:GetChild("Jacket");
		local height = Jacket:GetHeight();
		
		if song then
			if song:HasJacket() then
				Jacket:visible(true);
				Jacket:Load(song:GetJacketPath());
				Jacket:scaletoclipped(110,110);
			else
				Jacket:visible(true);
				Jacket:Load(song:GetBannerPath());
				Jacket:scaletoclipped(110,50);
			end;
		else
			Jacket:visible(false);
		end;
		
	end;
	t[#t+1] = Def.ActorFrame {
		OnCommand=cmd(x,SCREEN_CENTER_X-224.5;y,SCREEN_CENTER_Y;diffusealpha,0;sleep,1;linear,1;diffusealpha,1;rotationz,-25;SetUpdateFunction,JacketUpdate);
		OffCommand=cmd(decelerate,0.5;addy,700);
		CurrentSongChangedMessageCommand=cmd(addx,100;diffusealpha,0;rotationz,90;decelerate,0.05;rotationz,-25;addx,-100;diffusealpha,1);
		Def.Sprite {
			Name="Jacket";
		};	
	};
end;

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(addx,-224.5);
	OffCommand=cmd(decelerate,0.5;addy,700);
	LoadActor("jacket glow")..{
		InitCommand=cmd(zoom,0.205;x,SCREEN_CENTER_X-300;y,SCREEN_CENTER_Y;diffusealpha,0);
		OnCommand=cmd(decelerate,1;diffusealpha,1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,-25;diffuseshift; effectoffset,1; effectperiod, 3; effectcolor1, 0,0,0,0; effectcolor2, 1,1,1,1);
		CurrentSongChangedMessageCommand=cmd(addx,-100;diffusealpha,0;rotationz,90;decelerate,0.05;rotationz,-25;addx,100;diffusealpha,1);
	};
	LoadActor("jacket frame")..{
		InitCommand=cmd(zoom,0.205;x,SCREEN_CENTER_X-300;y,SCREEN_CENTER_Y;diffusealpha,0);
		OnCommand=cmd(decelerate,1;diffusealpha,1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;rotationz,-25);
		CurrentSongChangedMessageCommand=cmd(addx,-100;diffusealpha,0;rotationz,90;decelerate,0.05;rotationz,-25;addx,100;diffusealpha,1);
	};
};

t[#t+1] = Def.ActorFrame{
	LoadActor("DifficultyList")..{
		InitCommand=cmd(zoom,0.5;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-100;diffusealpha,0;rotationz,-90);
		OnCommand=cmd(sleep,0.5;linear,0.5;diffusealpha,1;y,SCREEN_CENTER_Y-80);
		SongChosenMessageCommand=cmd(decelerate,0.05;diffusealpha,1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+75;zoom,1);
		SongUnchosenMessageCommand=cmd(decelerate,0.05;diffusealpha,1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-80;zoom,0.5);
		TwoPartConfirmCanceledMessageCommand=cmd(decelerate,0.05;diffusealpha,1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-80;zoom,0.5);
		OffCommand=cmd(decelerate,0.15;diffusealpha,0;y,SCREEN_CENTER_Y+180);
	};
	Def.Sprite{
		Name= "lightning",
		Frames= {
		  {Frame= 0, Delay= 0.050},
		  {Frame= 1, Delay= 0.050},
		},
		  OnCommand= cmd(zoom,0.9;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+10;blend,Blend.Add;diffusealpha,0;queuecommand,"Appear"),
		  OffCommand=cmd(linear,0.5;diffusealpha,1;queuecommand,"Strike"),
		  StrikeCommand=cmd(diffuseshift; effectoffset,0.5; effectperiod, 3; effectcolor1, 1,1,1,0; effectcolor2, 1,1,1,1),
		  Texture= "out/lightning 1x2.png",
	},
	LoadActor("out/get ready")..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0);
		OffCommand=cmd(linear,0.15;diffusealpha,1;zoom,0.325;decelerate,0.8;zoom,0.2;accelerate,0.25;zoomy,0;zoomx,1);
	};
};

--Sound effects
t[#t+1] = Def.ActorFrame{
	LoadActor("sfx/cheer")..{
		OffCommand=cmd(sleep,1;queuecommand,"PlaySound");
		PlaySoundCommand=cmd(play);
	};
	LoadActor(THEME:GetPathS("","dark changing"))..{
		CurrentSongChangedMessageCommand=cmd(play);
	};
	LoadActor("sfx/ready")..{
		PlaySoundCommand=cmd(play);
		OffCommand=function(self)
			SOUND:StopMusic();
			self:queuecommand("PlaySound");
		end;
	};
};

t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenTitleMenu", "background/dark"))..{
		InitCommand=cmd(diffusealpha,0);
		OffCommand=cmd(sleep,1.25;diffusealpha,1);
	};
};


return t

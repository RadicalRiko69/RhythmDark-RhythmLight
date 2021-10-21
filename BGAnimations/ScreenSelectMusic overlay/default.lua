local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame{
	LoadActor("decorations")..{
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
				Jacket:scaletoclipped(220,220);
			else
				Jacket:visible(true);
				Jacket:Load(song:GetBannerPath());
				Jacket:scaletoclipped(220,220);
			end;
		else
			Jacket:visible(false);
		end;
		
	end;
	t[#t+1] = Def.ActorFrame {
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-50;diffusealpha,0;SetUpdateFunction,JacketUpdate);
		OffCommand=function(self)
			self:sleep(1.25);
			self:diffusealpha(1);
		end;
		Def.Sprite {
			Name="Jacket";
		};	
	};
end;

t[#t+1] = Def.Quad {
	OffCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,Color("White");diffusealpha,0;sleep,1.25;diffusealpha,1;linear,2;diffusealpha,0);
};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+150;diffusealpha,0;zoom,0.6);
	OffCommand=cmd(sleep,1.25;diffusealpha,1);
	-- CURRENT SONG NAME
LoadFont("_enigmatic unicode 20px")..{	
	InitCommand=cmd(x,0;y,-0;zoom,2;maxwidth,400);
	OnCommand=cmd(addy,-10);
	CurrentSongChangedMessageCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		if song then
			self:settext(song:GetDisplayFullTitle());
			self:diffusealpha(1);
		else
			self:diffusealpha(0);
		end;
	end;

};
-- CURRENT SONG ARTIST
LoadFont("_enigmatic unicode 20px")..{	
	InitCommand=cmd(x,0;y,34;zoom,1.5;maxwidth,1700);
	OnCommand=cmd(addy,-10);
	CurrentSongChangedMessageCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		if song then
			self:settext(song:GetDisplayArtist());
			self:diffusealpha(1);
		else
			self:diffusealpha(0);
		end;
	end;


};
--LENGTH DISPLAY
LoadFont("_enigmatic unicode 20px")..{
	InitCommand=cmd(diffusealpha,1;x,0;y,70;zoom,1;skewx,-0.2);
	OnCommand=cmd(addy,-10);
	CurrentSongChangedMessageCommand=function(self)
	if GAMESTATE:GetCurrentSong() then
		local length = GAMESTATE:GetCurrentSong():MusicLengthSeconds()
		self:settext("LENGTH: "..SecondsToMMSSMsMs(length));
	else
		self:settext("N/A");
	end;
end;
};	

--BPM DISPLAY
LoadFont("_enigmatic unicode 20px")..{
	InitCommand=cmd(diffusealpha,1;uppercase,true;x,0;y,-30;zoom,1;skewx,-0.2);
	OnCommand=cmd(addy,-10);
	CurrentSongChangedMessageCommand=function(self)

		local song = GAMESTATE:GetCurrentSong();
		-- ROAD24: more checks,
		-- TODO: decide what to do if no song is chosen, ignore or hide ??
		if song then
			local speedvalue;
			if song:IsDisplayBpmRandom() then
				speedvalue = "BPM: ???";
			else
				local rawbpm = GAMESTATE:GetCurrentSong():GetDisplayBpms();
				local lobpm = math.ceil(rawbpm[1]);
				local hibpm = math.ceil(rawbpm[2]);
				if lobpm == hibpm then
					speedvalue = "BPM: "..hibpm
				else
					speedvalue = "BPM: "..lobpm.."~"..hibpm
				end;
			end;
			self:settext(speedvalue);
			self:diffusealpha(1);
		else
			self:settext("N/A");
		end;
	end;
};
};

return t

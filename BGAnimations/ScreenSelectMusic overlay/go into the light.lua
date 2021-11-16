local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+150;diffusealpha,0;zoom,0.6);
	OffCommand=cmd(sleep,1.8;diffusealpha,1);
	-- CURRENT SONG NAME
LoadFont("_chiaro 36px")..{	
	InitCommand=cmd(x,0;y,-0;zoom,2;strokecolor,Color("Black");maxwidth,400);
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
LoadFont("_chiaro 36px")..{	
	InitCommand=cmd(x,0;y,34;zoom,1.5;strokecolor,Color("Black");maxwidth,1700);
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
LoadFont("_chiaro 36px")..{
	InitCommand=cmd(diffusealpha,1;x,0;y,70;zoom,1;strokecolor,Color("Black");skewx,-0.2);
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
LoadFont("_chiaro 36px")..{
	InitCommand=cmd(diffusealpha,1;uppercase,true;strokecolor,Color("Black");x,0;y,-30;zoom,1;skewx,-0.2);
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

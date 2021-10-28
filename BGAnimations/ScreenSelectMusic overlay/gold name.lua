
local t = Def.ActorFrame {};

	-- CURRENT SONG NAME
	t[#t+1] = LoadFont("_chiaro 36px")..{	
			InitCommand=cmd(x,-320;y,-4;horizalign,left;zoom,2;maxwidth,400);
			OnCommand=cmd(addy,-10);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0);
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
		t[#t+1] = LoadFont("_chiaro 36px")..{	
			InitCommand=cmd(x,-320;y,34;horizalign,left;zoom,1.5;maxwidth,540);
			OnCommand=cmd(addy,-10);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0);
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
		t[#t+1] = LoadFont("_chiaro 36px")..{
			InitCommand=cmd(diffusealpha,1;horizalign,left;uppercase,true;x,-318;y,-30;zoom,1;skewx,-0.2);
			OnCommand=cmd(addy,-10);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			CurrentSongChangedMessageCommand=function(self)
				self:settext("LENGTH:");
			end;
		};
		
		t[#t+1] = LoadFont("_chiaro 36px")..{
			InitCommand=cmd(diffusealpha,1;horizalign,left;x,-210;y,-30;zoom,1;maxwidth,120;skewx,-0.2);
			OnCommand=cmd(addy,-10);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			CurrentSongChangedMessageCommand=function(self)
			if GAMESTATE:GetCurrentSong() then
				local length = GAMESTATE:GetCurrentSong():MusicLengthSeconds()
				self:settext(SecondsToMMSSMsMs(length));
			else
				self:settext("N/A");
			end;
		end;
		};	

		--BPM DISPLAY
		t[#t+1] = LoadFont("_chiaro 36px")..{
			InitCommand=cmd(diffusealpha,1;uppercase,true;x,-80;y,-30;horizalign,left;zoom,1;skewx,-0.2);
			OnCommand=cmd(addy,-10);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			CurrentSongChangedMessageCommand=function(self)
				self:settext("BPM:");
			end;
		};
		
		t[#t+1] = LoadFont("_chiaro 36px")..{
			InitCommand=cmd(diffusealpha,1;uppercase,true;x,-20;y,-30;horizalign,left;zoom,1;skewx,-0.2);
			OnCommand=cmd(addy,-10);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			CurrentSongChangedMessageCommand=function(self)

				local song = GAMESTATE:GetCurrentSong();
				-- ROAD24: more checks,
				-- TODO: decide what to do if no song is chosen, ignore or hide ??
				if song then
					local speedvalue;
					if song:IsDisplayBpmRandom() then
						speedvalue = "???";
					else
						local rawbpm = GAMESTATE:GetCurrentSong():GetDisplayBpms();
						local lobpm = math.ceil(rawbpm[1]);
						local hibpm = math.ceil(rawbpm[2]);
						if lobpm == hibpm then
							speedvalue = hibpm
						else
							speedvalue = lobpm.."~"..hibpm
						end;
					end;
					self:settext(speedvalue);
					self:diffusealpha(1);
				else
					self:settext("N/A");
				end;
			end;
		};

return t
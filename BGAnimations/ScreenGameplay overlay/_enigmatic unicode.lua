local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-10;zoom,0.45);
	-- CURRENT SONG NAME
LoadFont("_enigmatic unicode 20px")..{	
	InitCommand=cmd(maxwidth,1000;draworder,99999);
	CurrentSongChangedMessageCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		if song then
			self:settext(song:GetDisplayFullTitle().."  -  "..song:GetDisplayArtist());
			self:diffusealpha(1);
		else
			self:diffusealpha(0);
		end;
	end;
	};
};
return t

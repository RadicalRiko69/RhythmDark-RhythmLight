local t = Def.ActorFrame{};

t[#t+1] = StandardDecorationFromFileOptional("StageDisplay","StageDisplay");

for pn in ivalues(PlayerNumber) do
	local MetricsName = "MachineRecord" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor( THEME:GetPathG(Var "LoadingScreen", "MachineRecord"), pn ) .. {
		InitCommand=function(self) 
			self:player(pn); 
			self:name(MetricsName); 
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); 
		end;
	};
end

for pn in ivalues(PlayerNumber) do
	local MetricsName = "PersonalRecord" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor( THEME:GetPathG(Var "LoadingScreen", "PersonalRecord"), pn ) .. {
		InitCommand=function(self) 
			self:player(pn); 
			self:name(MetricsName); 
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); 
		end;
	};
end

for pn in ivalues(PlayerNumber) do
	local MetricsName = "PeakComboAward" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor( THEME:GetPathG(Var "LoadingScreen", "PeakComboAward"), pn ) .. {
		InitCommand=function(self) 
			self:player(pn); 
			self:name(MetricsName); 
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); 
		end;
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local tStats = THEME:GetMetric(Var "LoadingScreen", "Summary") and STATSMAN:GetAccumPlayedStageStats() or STATSMAN:GetCurStageStats();
			tStats = tStats:GetPlayerStageStats(pn);
			if tStats:GetPeakComboAward() then
				self:settext( THEME:GetString( "PeakComboAward", ToEnumShortString( tStats:GetPeakComboAward() ) ) );
			else
				self:settext( "" );
			end
		end;
	};
end

t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenSelectMusic","overlay/jacket back"))..{
		InitCommand=cmd(zoom,0.205;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-100;diffusealpha,1);
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
				Jacket:scaletoclipped(110,110);
			end;
		else
			Jacket:visible(false);
		end;
		
	end;
	t[#t+1] = Def.ActorFrame {
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-100;SetUpdateFunction,JacketUpdate);
		Def.Sprite {
			Name="Jacket";
		};	
	};
end;

t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenSelectMusic","overlay/jacket glow"))..{
		InitCommand=cmd(zoom,0.205;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-100);
		OnCommand=cmd(diffuseshift; effectoffset,1; effectperiod, 3; effectcolor1, 0,0,0,0; effectcolor2, 1,1,1,1);
	};
	LoadActor(THEME:GetPathB("ScreenSelectMusic","overlay/jacket frame"))..{
		InitCommand=cmd(zoom,0.205;x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-100);
	};
};

t[#t+1] = StandardDecorationFromFileOptional("SongInformation","SongInformation") .. {
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X);
		self:y(SCREEN_BOTTOM-20);
		self:zoom(0.6);
	end;
	BeginCommand=function(self)
		local SongOrCourse;
		if GAMESTATE:GetCurrentSong() then
			SongOrCourse = GAMESTATE:GetCurrentSong();
		elseif GAMESTATE:GetCurrentCourse() then
			SongOrCourse = GAMESTATE:GetCurrentCourse();
		else
			return
		end
	end;
	SetCommand=function(self)
		local c = self:GetChildren();
		local SongOrCourse;
		if GAMESTATE:GetCurrentSong() then
			SongOrCourse = GAMESTATE:GetCurrentSong();

			c.TextTitle:settext( SongOrCourse:GetDisplayMainTitle() or nil );
			c.TextSubtitle:settext( SongOrCourse:GetDisplaySubTitle() or nil );
			c.TextArtist:settext( SongOrCourse:GetDisplayArtist() or nil );

			if SongOrCourse:GetDisplaySubTitle() == "" then
				c.TextTitle:visible(true);
				c.TextTitle:y(-16.5/2);
				c.TextSubtitle:visible(false);
				c.TextSubtitle:y(0);
				c.TextArtist:visible(true);
				c.TextArtist:y(18/2);
			else
				c.TextTitle:visible(true);
				c.TextTitle:y(-16.5);
				c.TextSubtitle:visible(true);
				c.TextSubtitle:y(0);
				c.TextArtist:visible(true);
				c.TextArtist:y(18);
			end
-- 			self:playcommand("Tick");
		elseif GAMESTATE:GetCurrentCourse() then
			SongOrCourse = GAMESTATE:GetCurrentCourse();
			
			c.TextTitle:settext( SongOrCourse:GetDisplayMainTitle() or nil );
			c.TextSubtitle:settext( SongOrCourse:GetDisplaySubTitle() or nil );
			c.TextArtist:settext( SongOrCourse:GetDisplayArtist() or nil );
			
-- 			self:playcommand("Tick");
		else
			SongOrCourse = nil;
			
			c.TextTitle:settext("");
			c.TextSubtitle:settext("");
			c.TextArtist:settext("");
			
			self:playcommand("Hide")
		end
	end;
-- 	OnCommand=cmd(playcommand,"Set");
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	DisplayLanguageChangedMessageCommand=cmd(playcommand,"Set");
};
t[#t+1] = StandardDecorationFromFileOptional("LifeDifficulty","LifeDifficulty");
t[#t+1] = StandardDecorationFromFileOptional("TimingDifficulty","TimingDifficulty");
t[#t+1] = StandardDecorationFromFileOptional("GameType","GameType") .. {
	InitCommand=function(self)
		if IsGame("pump") then
			self:settext("PIU");
		elseif IsGame("dance") then
			self:settext("DDR/ITG");
		else
			self:settext(sGame);
		end
	end;
};

return t

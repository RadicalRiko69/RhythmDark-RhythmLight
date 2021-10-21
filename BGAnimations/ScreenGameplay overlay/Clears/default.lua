--　FullCombo base from moonlight by AJ 187

local pn = ...;
assert(pn);
local t = Def.ActorFrame{};
local Center1Player = PREFSMAN:GetPreference('Center1Player');
local NumPlayers = GAMESTATE:GetNumPlayersEnabled();
local NumSides = GAMESTATE:GetNumSidesJoined();
local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
local st = GAMESTATE:GetCurrentStyle():GetStepsType();

local function GetPosition(pn)
--[[	if Center1Player and NumPlayers == 1 and NumSides == 1 then return SCREEN_CENTER_X; end;
	local strPlayer = (NumPlayers == 1) and "OnePlayer" or "TwoPlayers";
	local strSide = (NumSides == 1) and "OneSide" or "TwoSides";
	return THEME:GetMetric("ScreenGameplay","Player".. ToEnumShortString(pn) .. strPlayer .. strSide .."X");--]]
	if st == "StepsType_Dance_Double" or st == "StepsType_Dance_Solo" or Center1Player then return SCREEN_WIDTH/2;
	else 
	local strPlayer = (NumPlayers == 1) and "OnePlayer" or "TwoPlayers";
	local strSide = (NumSides == 1) and "OneSide" or "TwoSides";
	return THEME:GetMetric("ScreenGameplay","Player".. ToEnumShortString(pn) .. strPlayer .. strSide .."X");
end;
end;

-- Parts
t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenGameplay","overlay/Clears/hexa"))..{
	InitCommand=cmd(x,GetPosition(pn);y,SCREEN_CENTER_Y;zoom,1;rotationz,180;diffusealpha,0);
	OffCommand = function(self)
		if pss:FullCombo() or pss:FullComboOfScore('TapNoteScore_W3') then
			self:decelerate(1);
			self:diffusealpha(1);
			self:zoom(0.2);
			self:rotationz(0);
		end;
	end;
};
};

t[#t+1] = Def.Sound{
		OffCommand=function(self)
			if pss:FullComboOfScore('TapNoteScore_W1') then
				self:load(THEME:GetPathS("","gameplay/perfect"));
				self:play();
			elseif pss:FullComboOfScore('TapNoteScore_W2') then
				self:load(THEME:GetPathS("","gameplay/full"));
				self:play();
			elseif pss:FullCombo() or pss:FullComboOfScore('TapNoteScore_W3') then
				self:load(THEME:GetPathS("","gameplay/pass"));
				self:play();
			else
				self:stop();
			end;
		end;
	};


-- FullCombo text pictures
t[#t+1] = Def.Sprite{
		InitCommand=function(self)
			self:y(SCREEN_CENTER_Y);
			self:x(GetPosition(pn));
			self:zoom(0);
		end;
		OffCommand=function(self)
			if pss:FullComboOfScore('TapNoteScore_W1') then
				self:Load(THEME:GetPathB("ScreenGameplay","overlay/Clears/perfect"));
				self:sleep(0.25);
				self:decelerate(0.5);
				self:zoom(0.3);
			elseif pss:FullComboOfScore('TapNoteScore_W2') then
				self:Load(THEME:GetPathB("ScreenGameplay","overlay/Clears/full"));
				self:sleep(0.25);
				self:decelerate(0.5);
				self:zoom(0.3);
			elseif pss:FullComboOfScore('TapNoteScore_W3') then
				self:Load(THEME:GetPathB("ScreenGameplay","overlay/Clears/pass"));
				self:sleep(0.25);
				self:decelerate(0.5);
				self:zoom(0.3);
			else
				self:visible(false);
			end;
		end;
	};

return t;
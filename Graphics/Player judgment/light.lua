local c;
local player = Var "Player";
local function ShowProtiming()
  if GAMESTATE:IsDemonstration() then
    return false
  else
    return GetUserPrefB("UserPrefProtiming" .. ToEnumShortString(player));
  end
end;
local bShowProtiming = ShowProtiming();
local ProtimingWidth = 240;
local function MakeAverage( t )
	local sum = 0;
	for i=1,#t do
		sum = sum + t[i];
	end
	return sum / #t
end

local tTotalJudgments = {};

local JudgeCmds = {
	TapNoteScore_W1 = THEME:GetMetric( "Judgment", "JudgmentW1Command" );
	TapNoteScore_W2 = THEME:GetMetric( "Judgment", "JudgmentW2Command" );
	TapNoteScore_W3 = THEME:GetMetric( "Judgment", "JudgmentW3Command" );
	TapNoteScore_W4 = THEME:GetMetric( "Judgment", "JudgmentW4Command" );
	TapNoteScore_W5 = THEME:GetMetric( "Judgment", "JudgmentW5Command" );
	TapNoteScore_Miss = THEME:GetMetric( "Judgment", "JudgmentMissCommand" );
};

local ProtimingCmds = {
	TapNoteScore_W1 = THEME:GetMetric( "Protiming", "ProtimingW1Command" );
	TapNoteScore_W2 = THEME:GetMetric( "Protiming", "ProtimingW2Command" );
	TapNoteScore_W3 = THEME:GetMetric( "Protiming", "ProtimingW3Command" );
	TapNoteScore_W4 = THEME:GetMetric( "Protiming", "ProtimingW4Command" );
	TapNoteScore_W5 = THEME:GetMetric( "Protiming", "ProtimingW5Command" );
	TapNoteScore_Miss = THEME:GetMetric( "Protiming", "ProtimingMissCommand" );
};

local AverageCmds = {
	Pulse = THEME:GetMetric( "Protiming", "AveragePulseCommand" );
};
local TextCmds = {
	Pulse = THEME:GetMetric( "Protiming", "TextPulseCommand" );
};

local TNSFrames = {
	TapNoteScore_W1 = 0;
	TapNoteScore_W2 = 1;
	TapNoteScore_W3 = 2;
	TapNoteScore_W4 = 3;
	TapNoteScore_W5 = 4;
	TapNoteScore_Miss = 5;
};
local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathG("Judgment","Light")) .. {
		Name="Judgment";
		InitCommand=cmd(pause;visible,false);
		OnCommand=THEME:GetMetric("Judgment","JudgmentOnCommand");
		ResetCommand=cmd(finishtweening;stopeffect;visible,false);
	};
	LoadFont("Combo Numbers") .. {
		Name="ProtimingDisplay";
		Text="";
		InitCommand=cmd(visible,false);
		OnCommand=THEME:GetMetric("Protiming","ProtimingOnCommand");
		ResetCommand=cmd(finishtweening;stopeffect;visible,false);
	};
	InitCommand = function(self)
		c = self:GetChildren();
	end;

	JudgmentMessageCommand=function(self, param)
        -- Fix Player Combo animating when player successfully avoids a mine.
        local msgParam = param;
        MESSAGEMAN:Broadcast("TestJudgment",msgParam);
        --
		if param.Player ~= player then return end;
		if param.HoldNoteScore then return end;
		
		local iNumStates = c.Judgment:GetNumStates();
		local iFrame = TNSFrames[param.TapNoteScore];
		
		if not iFrame then return end
		if iNumStates == 12 then
			iFrame = iFrame * 2;
			if not param.Early then
				iFrame = iFrame + 1;
			end
		end
		

		local fTapNoteOffset = param.TapNoteOffset;
		if param.HoldNoteScore then
			fTapNoteOffset = 1;
		else
			fTapNoteOffset = param.TapNoteOffset; 
		end
		
		if param.TapNoteScore == 'TapNoteScore_Miss' then
			fTapNoteOffset = 1;
			bUseNegative = true;
		else
-- 			fTapNoteOffset = fTapNoteOffset;
			bUseNegative = false;
		end;
		
		if fTapNoteOffset ~= 1 then
			-- we're safe, you can push the values
			tTotalJudgments[#tTotalJudgments+1] = math.abs(fTapNoteOffset);
--~ 			tTotalJudgments[#tTotalJudgments+1] = bUseNegative and fTapNoteOffset or math.abs( fTapNoteOffset );
		end
		
		self:playcommand("Reset");

		c.Judgment:visible( not bShowProtiming );
		c.Judgment:setstate( iFrame );
		JudgeCmds[param.TapNoteScore](c.Judgment);
	end;

};


return t;

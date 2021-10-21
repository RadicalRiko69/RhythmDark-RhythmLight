local t = Def.ActorFrame{}

local newBPS;
local oldBPS;

-- METERS ////////////////////////
local style = ToEnumShortString(GAMESTATE:GetCurrentStyle():GetStyleType())

for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = LoadActor("Clears", pn) .. {
	};
end;

if style == "OnePlayerOneSide" and PREFSMAN:GetPreference("Center1Player") == true then
	t[#t+1] = LoadActor("centered_lifebar",GAMESTATE:GetMasterPlayerNumber())..{
		InitCommand=cmd(xy,SCREEN_CENTER_X,34);
	};
elseif style == "TwoPlayersTwoSides" or style == "OnePlayerOneSide" then
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		local width = 180
		local xPos = THEME:GetMetric("ScreenGameplay","Player"..pname(pn).."OnePlayerOneSideX")
		if pn == PLAYER_1 then
			xPos = xPos;
		else
			xPos = xPos;
		end;
		
		--The good lifebar
		t[#t+1] = LoadActor("centered_lifebar", pn,width)..{
			InitCommand=cmd(y,30);
			OnCommand=function(self)
				self:x(xPos+20);
				if pn == PLAYER_2 then
					self:rotationy(180);
					self:x(xPos-20);
				end;
				--[[if pn == PLAYER_1 then
					self:x(SCREEN_WIDTH/4);
					self:horizalign(left);
				else
					self:x(SCREEN_WIDTH*.75);
					self:horizalign(right);
				end;]]
			end;
		};
		t[#t+1] = Def.Sprite{
			Texture="border";
			InitCommand=cmd(zoomx,0.54;zoomy,0.55;addy,30);
		    OnCommand=function(self)
		    	if pn == PLAYER_1 then
		    		self:horizalign(right);
		    		self:x(xPos-width/2-5);
	    		else
					self:x(xPos+width/2+3.5);
	    			self:horizalign(left);
	    		end;
		    end;
		};
		t[#t+1] = Def.Sprite{
			Texture=getenv("profile_icon_"..pname(pn));
		    InitCommand=cmd(zoomto,39,38;y,30+19;vertalign,bottom;);
		    OnCommand=function(self)
		    	if pn == PLAYER_1 then
		    		self:horizalign(right);
		    		self:x(xPos-width/2-12);
	    		else
	    			self:x(xPos+width/2+11.5);
	    			self:horizalign(left);
	    		end;
		    end;
		};
		t[#t+1] = LoadFont("_@dfghsgothic-w9 25px") .. {
			InitCommand=cmd(maxwidth,580;y,12;zoom,0.45;shadowlength,1;skewx,-0.2);
			OnCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(left);
					self:x(xPos-width/2-0);
				else
					self:horizalign(right);
					self:x(xPos+width/2+0);
				end;
			end;
		
			
			BeginCommand=function(self)
				local profile = PROFILEMAN:GetProfile(pn);
				local name = profile:GetDisplayName();
				
				if GAMESTATE:IsHumanPlayer(pn) == true then
					if name=="" and SCREENMAN:GetTopScreen():GetName() ~= "ScreenDemonstration" then
						self:settext("Player");
					else
						self:settext( name );
					end
				end	
				
			end;
		};
		--DIFFICULTY LEVEL
		t[#t+1] = LoadFont("_@dfghsgothic-w9 25px") .. {
			InitCommand=function(self)
				if pn == PLAYER_1 then
					self:horizalign(left);
					self:x(xPos-width/2-0);
					self:y(45);
					self:zoom(0.45);
					self:skewx(-0.2);
				else
					self:horizalign(right);
					self:x(xPos+width/2+0);
					self:y(45);
					self:zoom(0.45);
					self:skewx(-0.2);
				end;
			end;
			OnCommand=function(self)
			  if GAMESTATE:GetCurrentSteps(pn) then
				  local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty();
				  if diff == "Difficulty_Beginner" then
					  self:settext("Novice Lv."..GAMESTATE:GetCurrentSteps(pn):GetMeter());
				  elseif diff == "Difficulty_Easy" then
					  self:settext("Easy Lv."..GAMESTATE:GetCurrentSteps(pn):GetMeter());
				  elseif diff == "Difficulty_Medium" then
					  self:settext("Medium Lv."..GAMESTATE:GetCurrentSteps(pn):GetMeter());
				  elseif diff == "Difficulty_Hard" then
					  self:settext("Hard Lv."..GAMESTATE:GetCurrentSteps(pn):GetMeter());
				  elseif diff == "Difficulty_Challenge" then
					  self:settext("Expert Lv."..GAMESTATE:GetCurrentSteps(pn):GetMeter());
				  elseif diff == "Difficulty_Edit" then
					  self:settext("Edit Lv."..GAMESTATE:GetCurrentSteps(pn):GetMeter());
				  else
					  self:settext("what do I put here?");
				  end
			  end;
		  end;
		};
	end;
else

	local pn = GAMESTATE:GetMasterPlayerNumber()
	local width = 400
	local xPos = SCREEN_CENTER_X
	-- Doubles... And legacy code.
	t[#t+1] = LoadActor("centered_lifebar", pn,width)..{
		InitCommand=cmd(xy,xPos-25,30);
		OnCommand=function(self)
			if pn == PLAYER_1 then
				self:x(xPos+25);
			else
				self:x(xPos-25);
			end;
		end;

	}
	t[#t+1] = Def.Sprite{
		Texture="border";
		InitCommand=cmd(zoomx,0.54;zoomy,0.55;addy,30);
		OnCommand=function(self)
			if pn == PLAYER_1 then
				self:horizalign(right);
				self:x(xPos-width/2-0);
			else
				self:x(xPos+width/2-1);
				self:horizalign(left);
			end;
		end;
	};
	t[#t+1] = Def.Sprite{
		Texture=getenv("profile_icon_"..pname(pn));
	    InitCommand=cmd(zoomto,39,38;y,30+19;vertalign,bottom;);
	    OnCommand=function(self)
	    	if pn == PLAYER_1 then
	    		self:horizalign(right);
	    		self:x(xPos-width/2-7);
    		else
    			self:x(xPos+width/2+7);
    			self:horizalign(left);
    		end;
	    end;
	};
	t[#t+1] = LoadFont("_@dfghsgothic-w9 25px") .. {
		InitCommand=cmd(maxwidth,1200;y,12;zoom,0.45;shadowlength,1;skewx,-0.2);
		OnCommand=function(self)
			if pn == PLAYER_1 then
				self:horizalign(left);
				self:x(xPos-width/2-0);
			else
				self:horizalign(right);
				self:x(xPos+width/2+0);
			end;
		end;
	
		
		BeginCommand=function(self)
			local profile = PROFILEMAN:GetProfile(pn);
			local name = profile:GetDisplayName();
			
			if GAMESTATE:IsHumanPlayer(pn) == true then
				if name=="" and SCREENMAN:GetTopScreen():GetName() ~= "ScreenDemonstration" then
					self:settext("Player");
				else
					self:settext( name );
				end
			end	
			
		end;
	};
	--DIFFICULTY LEVEL
	t[#t+1] = LoadFont("_@dfghsgothic-w9 25px") .. {
		InitCommand=function(self)
			if pn == PLAYER_1 then
				self:horizalign(left);
				self:x(xPos-width/2-0);
				self:y(45);
				self:zoom(0.45);
				self:skewx(-0.2);
			else
				self:horizalign(right);
				self:x(xPos+width/2+0);
				self:y(45);
				self:zoom(0.45);
				self:skewx(-0.2);
			end;
		end;
		OnCommand=function(self)
		  if GAMESTATE:GetCurrentSteps(pn) then
			  local diff = GAMESTATE:GetCurrentSteps(pn):GetDifficulty();
			  if diff == "Difficulty_Beginner" then
				  self:settext("Novice Lv."..GAMESTATE:GetCurrentSteps(pn):GetMeter());
			  elseif diff == "Difficulty_Easy" then
				  self:settext("Easy Lv."..GAMESTATE:GetCurrentSteps(pn):GetMeter());
			  elseif diff == "Difficulty_Medium" then
				  self:settext("Medium Lv."..GAMESTATE:GetCurrentSteps(pn):GetMeter());
			  elseif diff == "Difficulty_Hard" then
				  self:settext("Hard Lv."..GAMESTATE:GetCurrentSteps(pn):GetMeter());
			  elseif diff == "Difficulty_Challenge" then
				  self:settext("Expert Lv."..GAMESTATE:GetCurrentSteps(pn):GetMeter());
			  elseif diff == "Difficulty_Edit" then
				  self:settext("Edit Lv."..GAMESTATE:GetCurrentSteps(pn):GetMeter());
			  else
				  self:settext("what do I put here?");
			  end
		  end;
	  end;
	};
end


return t

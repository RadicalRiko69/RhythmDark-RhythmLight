local function getProfileName(player)
	local profile = PROFILEMAN:GetProfile(player)
	local name = profile:GetDisplayName()
	--SCREENMAN:SystemMessage(name)
	
	if MEMCARDMAN:GetCardState(player) == 'MemoryCardState_none' then
		--If name is blank, it's probably the machine profile... After all, the name entry screen doesn't allow blank names.
		if name == "" then		
			if player == PLAYER_1 then
				return "PLAYER 1"
			else
				return "PLAYER 2"
			end;
		else
			--TODO: Adjust maxwidth based on the number of hearts per play.
			return name
		end
	else
		return name;
	end
end;

local function genPlayerFrame(player, xPos)
	return Def.ActorFrame {
		InitCommand=cmd(x,xPos;y,SCREEN_CENTER_Y-110;diffusealpha,0);
		OnCommand=cmd(decelerate,0.5;diffusealpha,1);
		LoadActor("border")..{
		    InitCommand=cmd(zoomx,0.54;zoomy,0.55;addx,-0.65);
		    OnCommand=cmd(decelerate,0.5;addy,-52;diffusealpha,1);
		    OffCommand=cmd(decelerate,0.5;addy,52;diffusealpha,0);
		};
		Def.Sprite{
			Texture=getenv("profile_icon_"..pname(player));
		    InitCommand=cmd(zoomto,40,40);
		    OnCommand=cmd(decelerate,0.5;addy,-52;diffusealpha,1);
		    OffCommand=cmd(decelerate,0.5;addy,52;diffusealpha,0);
		};
		LoadActor("blackline")..{
		    InitCommand=cmd(zoom,0.35;);
		    OnCommand=cmd(decelerate,0.5;addy,-25;diffusealpha,1);
		    OffCommand=cmd(decelerate,0.5;addy,50;diffusealpha,0);
		};
		--The vertical alignment on this font is beyond stupid
		LoadFont("_enigmatic unicode 20px")..{
		    InitCommand=cmd(zoom,.5;decelerate,0.5;addy,-20;);
			OffCommand=cmd(decelerate,0.5;addy,50;diffusealpha,0);
			--Text=THEME:GetString("Common","Username");
			--[[
			Return string before '.' character:
			:match("[^.]+")
			ex. local str = "Nine The Phantom.jpg"
			str:match("[^.]+") -> Nine The Phantom
			]]
			Text=getProfileName(player)
			--[[OnCommand=function(self)
				self:settext("ScienceNight");
				(cmd(zoom,.5)) (self)
			end;]]
		};
		--[[OnCommand=function(self)
			SCREENMAN:SystemMessage("HELLO WORLD");
		end;]]
	};
end;

if GAMESTATE:GetNumSidesJoined() == 1 then
	--I have no idea why this needs to be wrapped in an ActorFrame, but it shouldn't be
	return Def.ActorFrame{ genPlayerFrame(GAMESTATE:GetMasterPlayerNumber(),SCREEN_CENTER_X) };
else
	return Def.ActorFrame{
		genPlayerFrame(PLAYER_1,SCREEN_WIDTH*.35);
		genPlayerFrame(PLAYER_2,SCREEN_WIDTH*.65);
	}
end;

function table.shallowcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

--[[
This defines the custom player options. PlayerDefaults is initialized from InitGame.lua
Use ActiveModifiers["P1"] or ActiveModifiers["P2"] to access options. ActiveModifiers
is automatically set when the profile is loaded.
]]
PlayerDefaults = {
	DetailedPrecision = false, --Options: false, EarlyLate, ProTiming
	--ReverseGrade = false, --Like the PIU thing? Perfect is shown as bad
	ScreenFilter = 0,
	BGAMode = "On", --Options: Black, Off, Dark, On
	
	--[[
	ProfileIcon does NOT have the full path of the profile icon because we support custom icons in the LocalProfile/USB Profile.
	To get the full path use getenv("profile_icon_PX") (where X is the player number).
	The same warning is in 04 SL-CustomProfiles.lua.
	]]
	ProfileIcon = false, -- Technically not an OptionsList option, but it gets saved at ScreenProfileSave so it's here anyway. Don't set it to nil the SL-CustomProfiles code is retarded and won't iterate over it
	ProfileFrame = false, --Same as above.
	--JudgmentGraphic = "Season2", --Judgment graphic
	--CompetitionMode = false, --Show score and HP in the middle to make things more exciting
	--[[
	Like IIDX, Simply Love, etc.
	Possible values: 70%, 80%, 90%, 95%, 100%, Player's Best, Machine Best
	We use percentages, not grades for target score
	because PIU/RIO grading is weird and you can't get an S if you miss a note.
	]]
	--TargetScore = false,
}

--PerfectionistMode should NEVER be written to profile, so it's not in the PlayerDefaults table.
PerfectionistMode = {
	PlayerNumber_P1 = false,
	PlayerNumber_P2 = false,
	PlayerNumber_P3 = false,
	PlayerNumber_P4 = false
};

--Requires string:split
function OptionRowAvailableNoteskins()
	local ns = NOTESKIN:GetNoteSkinNames();
	local disallowedNS = THEME:GetMetric("Common","NoteSkinsToHide"):split(",");
	for i = 1, #disallowedNS do
		for k,v in pairs(ns) do
			if v == disallowedNS[i] then
				table.remove(ns, k)
			end
		end;
	end;
	--Make this global so the OptionsList shit in SSM can access it.
	OPTIONSLIST_NUMNOTESKINS = #ns
	OPTIONSLIST_NOTESKINS = ns
	local t = {
		Name="NoteskinsCustom",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = false,
		ExportOnChange = false,
		Choices = ns,
		LoadSelections = function(self, list, pn)
			--SCREENMAN:SystemMessage("Num items: "..#ns)
			--This returns an instance of playerOptions, you need to set it back to the original
			local playerOptions = GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred")
			local curNS = playerOptions:NoteSkin();
			local found = false;
			for i=1,#list do
				if ns[i] == curNS then
					list[i] = true;
					found = true;
				end;
			end;
			if not found then
				assert(found,"There was no noteskin selected, but the player's noteskin should be "..curNS);
				list[1] = true;
			end;
		end,
		SaveSelections = function(self, list, pn)
			local pName = ToEnumShortString(pn)
			--list[1] = true;
			local found = false
			for i=1,#list do
				if not found then
					if list[i] == true then
						GAMESTATE:GetPlayerState(pn):GetPlayerOptions("ModsLevel_Preferred"):NoteSkin(ns[i]);
						found = true
						--SCREENMAN:SystemMessage("NS set to "..ns[i]);
					end
				end
			end
		end,
	};
	setmetatable(t, t)
	return t
end

--Thanks to Midflight Digital (again)
function OptionRowScreenFilter()
	local t = {
		Name="Filter",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = false,
		ExportOnChange = false,
		Choices = { "0%", "20%", "40%", "60%", "80%", "100%"},
		LoadSelections = function(self, list, pn)
			local pName = ToEnumShortString(pn)
			--Stored filterValue is a number out of 100
			local filterValue = ActiveModifiers[pName]["ScreenFilter"]

			if filterValue ~= nil then
				--Ex: If filterValue is 100, then 100/20 -> 5, +1 -> 6 because lua has 1-indexed lists
				list[filterValue/20+1] = true;
			else
				list[1] = true
			end
		end,
		SaveSelections = function(self, list, pn)
			local pName = ToEnumShortString(pn)
			local found = false
			for i=1,#list do
				if not found then
					if list[i] == true then
						--If selected value in the list is the 6th it would be 100%
						--Substract 1 because lua is 1-indexed, so 5*20 -> 100.
						ActiveModifiers[pName]["ScreenFilter"] = (i-1)*20;
						found = true
					end
				end
			end
		end,
	};
	setmetatable(t, t)
	return t
end

function OptionRowPerfectionistMode()		--Perfectionist Mode 2.0 rewritten by Rhythm Lunatic
	local t = {
		Name = "PerfectionistMode";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = false;		--We actually DON'T want this true, we want it to only apply to one player.
		ExportOnChange = false;
		Choices = { "Off", "On"};
		LoadSelections = function(self, list, pn)
			local perfMode = PerfectionistMode[pn] --Get the player's PerfectionistMode preference
			if perfMode == true then --You don't really need the == true here but whatever
				list[2] = true; --Make the "On" choice selected
			else
				list[1] = true; --Else, make the "Off" choice selected
			end;
		end;
		SaveSelections = function(self, list, pn)
			--If list[2] (The On choice) is selected, then it would get set true in ActiveModifiers. If it's not selected, it's false, so it gets set false in ActiveModifiers.
			PerfectionistMode[pn] = list[2];
		end;
	};
	setmetatable( t, t );
	return t;
end;

function OptionRowCompetitionMode()
	local t = {
		Name = "CompetitionMode";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = false;
		ExportOnChange = false;
		Choices = { "Off", "On"};
		LoadSelections = function(self, list, pn)
			local perfMode = ActiveModifiers[pname(pn)]['CompetitionMode'] --Get the player's PerfectionistMode preference
			if perfMode == true then --You don't really need the == true here but whatever
				list[2] = true; --Make the "On" choice selected
			else
				list[1] = true; --Else, make the "Off" choice selected
			end;
		end;
		SaveSelections = function(self, list, pn)
			--If list[2] (The On choice) is selected, then it would get set true in ActiveModifiers. If it's not selected, it's false, so it gets set false in ActiveModifiers.
			ActiveModifiers[pname(pn)]['CompetitionMode'] = list[2];
		end;
	};
	setmetatable( t, t );
	return t;
end;

function OptionRowBGAMode() --BGAMode v2 by Rhythm Lunatic, original by Alisson A2 (Alisson de Oliveira)
	local t = {
		Name = "UserPrefBGAMode";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		--Once again, we DON'T want this true for both players, because it should be a per profile preference.
		--If one player has a BGA preference it would apply to both during the song, but it should still be
		--individually selectable. The order of preference is first to last, so Black Screen overrides No BGA.
		OneChoiceForAllPlayers = false;
		ExportOnChange = true;
		Choices = { "Black", "Generic BGA", "BGA On"};
		LoadSelections = function(self, list, pn)
			local bgaMode = ActiveModifiers[pname(pn)]["BGAMode"]
			if bgaMode == "Black" then
				list[1] = true
			elseif bgaMode == "Off" then
				list[2] = true
			else
				list[3] = true
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				ActiveModifiers[pname(pn)]["BGAMode"] = "Black"
			elseif list[2] then
				ActiveModifiers[pname(pn)]["BGAMode"] = "Off"
			else
				ActiveModifiers[pname(pn)]["BGAMode"] = "On";
			end;
		end;
	};
	setmetatable( t, t );
	return t;
end;


function OptionRowDetailedPrecision()
	local t = {
		Name = "UserPrefDetailedPrecision";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = false;
		ExportOnChange = true;
		Choices = {"Early/Late Indicators", "ProTiming Graph", "Off"};
		LoadSelections = function(self, list, pn)
			local opt = ActiveModifiers[pname(pn)]["DetailedPrecision"]
			if opt == "EarlyLate" then
				list[1] = true
			elseif opt == "ProTiming" then
				list[2] = true
			else
				list[3] = true
			end;
		end;
		SaveSelections = function(self, list, pn)
			if list[1] then
				ActiveModifiers[pname(pn)]["DetailedPrecision"] = "EarlyLate";
			elseif list[2] then
				ActiveModifiers[pname(pn)]["DetailedPrecision"] = "ProTiming";
			else
				ActiveModifiers[pname(pn)]["DetailedPrecision"] = false;
			end;
		end;
	};
	setmetatable( t, t );
	return t;
end;

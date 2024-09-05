local CATEGORY_NAME = "Thickened"
function ulx.addblocked( calling_ply )

local ent = calling_ply:GetEyeTraceNoCursor().Entity
            if !IsValid(ent) then
            ULib.tsay( calling_ply, "You need to be looking at a prop ")
            return
            end

            RunConsoleCommand("FPP_AddBlockedModel", ent:GetModel())
end
local addblocked = ulx.command( CATEGORY_NAME, "ulx addblocked", ulx.addblocked, "!addblocked" )
addblocked:help( "Adds the prop you're looking at to the FPP blocked models" )
addblocked:defaultAccess( ULib.ACCESS_ADMIN )

function ulx.addblockedpath( calling_ply,target_ent )

            RunConsoleCommand("FPP_AddBlockedModel", target_ent)
end
local addblockedpath = ulx.command( CATEGORY_NAME, "ulx addblockedpath", ulx.addblockedpath, "!addblockedpath" )
addblockedpath:help( "Adds the prop to the FPP blocked models" )
addblockedpath:addParam{ type=ULib.cmds.StringArg, hint="models/props_c17/oildrum001_explosive.mdl" }
addblockedpath:defaultAccess( ULib.ACCESS_ADMIN )

function ulx.removeblockedpath( calling_ply,target_ent )

            RunConsoleCommand("FPP_RemoveBlockedModel", target_ent)
end
local removeblockedpath = ulx.command( CATEGORY_NAME, "ulx removeblockedpath", ulx.removeblockedpath, "!removeblockedpath" )
removeblockedpath:help( "removes the prop from the FPP blocked models" )
removeblockedpath:addParam{ type=ULib.cmds.StringArg, hint="models/props_c17/oildrum001_explosive.mdl" }
removeblockedpath:defaultAccess( ULib.ACCESS_ADMIN )

function ulx.supersilentslay( calling_ply,target_ply )
		local pos = target_ply:GetPos()
		local angle = target_ply:GetAngles()
		target_ply:Kill()
		timer.Create( "Respawn", 0.5, 0, function()
			local ply = target_ply
				if !ply:Alive() then
					ply:Spawn()
					ply:SetPos( pos )
					ply:SetEyeAngles( angle )
				end
			end)
end
local supersilentslay = ulx.command( CATEGORY_NAME, "ulx supersilentslay", ulx.supersilentslay, "!supersilentslay" )
supersilentslay:help( "Basically kills them, and sets them back to where they died." )
supersilentslay:defaultAccess( ULib.ACCESS_ADMIN )
supersilentslay:addParam{ type=ULib.cmds.PlayerArg }

function ulx.silentsuicide( calling_ply )
			local pos = calling_ply:GetPos()
			local angle = calling_ply:GetAngles()
			calling_ply:Kill()
			timer.Create( "Respawn", 0.5, 0, function()
			local ply = calling_ply
				if !ply:Alive() then
					ply:Spawn()
					ply:SetPos( pos )
					ply:SetEyeAngles( angle )
				end
			end)
			
end
local silentsuicide = ulx.command( CATEGORY_NAME, "ulx silentsuicide", ulx.silentsuicide, "!silentsuicide" )
silentsuicide:help( "Basically kills them, and sets them back to where they died." )
silentsuicide:defaultAccess( ULib.ACCESS_ADMIN )

function ulx.detailedinfo( calling_ply,target_ply )
SetGlobalString( "target_model", target_ply:GetModel() )
ULib.clientRPC( calling_ply, "ulx.infoboxClientSide" )
end
local detailedinfo = ulx.command( CATEGORY_NAME, "ulx detailedinfo", ulx.detailedinfo, "!detailedinfo" )
detailedinfo:help( "Basically kills them, and sets them back to where they died." )
detailedinfo:defaultAccess( ULib.ACCESS_ADMIN )
detailedinfo:addParam{ type=ULib.cmds.PlayerArg }
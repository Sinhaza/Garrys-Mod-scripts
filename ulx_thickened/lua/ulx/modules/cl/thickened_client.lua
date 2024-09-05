function ulx.infoboxClientSide()
local target_model = GetGlobalString("target_model")
local infodisplay = vgui.Create( "DFrame" )
	infodisplay:SetPos( 10, 10 )
	infodisplay:SetSize( 200, 200 )
	infodisplay:MakePopup()
	infodisplay:SetSize( 600,200 )
	infodisplay:Center()
	infodisplay:SetTitle( "Are you AFK?" )
	infodisplay:SetDraggable( false )
	infodisplay.Width = 600
	infodisplay.Height = 200
	infodisplay:ShowCloseButton( false )
	infodisplay:SetBackgroundBlur( true )

	local infodisplaytext = vgui.Create( "DLabel", infodisplay )
	infodisplaytext:SetText( "Are You AFK?" )
	infodisplaytext:Center()
	infodisplaytext:SetWidth( 600 )
	infodisplaytext:SetFont( "DebugFixed" )
	
	local infodisplaybutton = vgui.Create( "DButton", infodisplay )
	infodisplaybutton:SetPos( infodisplay.Width/2-25, infodisplay.Height/2+30 )
	infodisplaybutton:SetText( "Not AFK" )
	infodisplaybutton.DoClick = function()

		RunConsoleCommand( "say", "I'm not AFK." )
		infodisplay:Close()

	end
	
	local icon = vgui.Create( "DModelPanel", infodisplay )
icon:SetSize( 200, 200 )
icon:SetModel( target_model )
function icon:LayoutEntity( Entity ) return end -- disables default rotation
function icon.Entity:GetPlayerColor() return Vector ( 1, 0, 0 ) end --we need to set it to a Vector not a Color, so the values are normal RGB values divided by 255.

	
end

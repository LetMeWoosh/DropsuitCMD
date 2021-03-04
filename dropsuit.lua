local cfg = {
    cmds = {"!dropsuit", "/dropsuit", "/droparmour", "!droparmour"}
}



hook.Add("PlayerSay", "dropsuit", function(ply, txt)
    local cmd = string.Trim(txt)
    if table.HasValue(cfg.cmds, cmd) then
	   if ply.armorSuit and ply:Alive() then
			DarkRP.notify(ply, 0, 5, "Suits: Dropping in 5 seconds")
			timer.Simple( 5, function()
            if !ply:Alive() then return end	
            local armor = ply.armorSuit
            local armorclass = Armor:Get(armor)
            local trace = {}
			trace.start = ply:EyePos()
            trace.endpos = trace.start + ply:GetAimVector() * 85
            trace.filter = ply
            local tr = util.TraceLine(trace)
			local dropped = ents.Create(armorclass.Entitie)
            dropped:Spawn()
			DarkRP.notify(ply, 0, 2, "Suits: Your suit has dropped")
			ply:removeArmorSuit()
			dropped:SetPos(tr.HitPos)
			end )
        else
            DarkRP.notify(ply, 1, 2, "Suits: No suit on!")
        end
        return ""
    end
end)

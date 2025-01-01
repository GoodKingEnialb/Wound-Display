-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

function onInit()
	super.onInit();
	table.insert(DataCommon.dmgtypes, "drain");
	table.insert(DataCommon.specialdmgtypes, "drain");
	onHealthChanged();
end

function onFactionChanged()
	super.onFactionChanged();
	updateHealthDisplay();
end

function onHealthChanged()
	local rActor = ActorManager.resolveActor(getDatabaseNode())
	local sColor = ActorHealthManager.getHealthColor(rActor);
	
	wounds.setColor(sColor);
	curhp.setColor(sColor);
	status.setColor(sColor);
end

function updateHealthDisplay()
	local sOption;
	if friendfoe.getStringValue() == "friend" then
		sOption = OptionsManager.getOption("SHPC");
	else
		sOption = OptionsManager.getOption("SHNPC");
	end
	
	if sOption == "detailed" then
		hptotal.setVisible(true);
		hptemp.setVisible(true);
		wounds.setVisible(true);
		curhp.setVisible(true);

		status.setVisible(false);
	elseif sOption == "status" then
		hptotal.setVisible(false);
		hptemp.setVisible(false);
		wounds.setVisible(false);
		curhp.setVisible(false);

		status.setVisible(true);
	else
		hptotal.setVisible(false);
		hptemp.setVisible(false);
		wounds.setVisible(false);
		curhp.setVisible(false);

		status.setVisible(false);
	end

	if sub_active and sub_active.subwindow then
		sub_active.subwindow.updateHealthDisplay(sOption);
	end
end

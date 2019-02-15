state ("DERU", "1.0.12"){

	byte finishedLevel : "UnityPlayer.dll", 0x00FE757C, 0x14, 0x4, 0x38, 0x28, 0x8, 0x38, 0xC60;
	byte start : "UnityPlayer.dll", 0x00FE7778, 0x24, 0x14, 0x98, 0xC4, 0x0, 0x940; 
}

init {

	if (modules.First().ModuleMemorySize == 0xA1000)
		version = "1.0.12";

	vars.startTime = DateTime.Now.TimeOfDay; //this value is never used but apparently I cannot define the var on start straight up

}


start {
	
	if (current.start == 0 && old.start != 0)
		vars.startTime = DateTime.Now.TimeOfDay;
	if (DateTime.Now.TimeOfDay.TotalSeconds - vars.startTime.TotalSeconds >= 0.8 && !(DateTime.Now.TimeOfDay.TotalSeconds - vars.startTime.TotalSeconds >= 3) && current.start == 0) //delay the start by 0.8 to be more accurate. An extra check is needed to allow for resets ingame and not just in the menu
		return true;
		
}

split {

	return current.finishedLevel == 0 && old.finishedLevel != 0;
}
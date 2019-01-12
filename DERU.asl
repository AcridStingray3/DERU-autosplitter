state ("DERU"){

	byte finishedLevel : "UnityPlayer.dll", 0x00FE757C, 0x14, 0x4, 0x38, 0x28, 0x8, 0x38, 0xC60;
	byte start : "UnityPlayer.dll", 0x00FE7778, 0x24, 0x14, 0x98, 0xC4, 0x0, 0x940; 
}

start {

	return current.start == 0 && old.start != 0;
}

split {

	return current.finishedLevel == 0 && old.finishedLevel != 0;
}
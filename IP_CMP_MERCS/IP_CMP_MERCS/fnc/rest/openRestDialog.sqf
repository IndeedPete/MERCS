createDialog "IP_DLG_REST";
sliderSetRange [1900, 1, 24];
sliderSetPosition [1900, 1];
[1000, (sliderPosition 1900)] call IP_fnc_setRestHoursTime;
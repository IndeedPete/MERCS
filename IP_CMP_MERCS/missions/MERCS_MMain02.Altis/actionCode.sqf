{
	_this spawn {
		private ["_target", "_unit", "_id", "_sinkside", "_attachpos", "_uy", "_relativedir", "_democharge", "_sinktime", "_smokeloc", "_smoke_e", "_smoke", "_x", "_y", "_z", "_x1", "_y1", "_x2", "_y2", "_x3", "_y3", "_z1", "_z2", "_z3"];	
		_target = _this select 0;
		_unit   = _this select 1;
		_id     = _this select 2;

		if(!("SatchelCharge_Remote_Mag" in (magazines _unit))) exitWith {hint "You have no Explosive Satchel to plant!"};
		
		_unit removeMagazine "SatchelCharge_Remote_Mag";    
		_target removeAction _id;    
		_relativedir = [_target, _unit] call BIS_fnc_relativeDirTo;    
		_sinkside = "";
		_attachpos = [0, 0, 0];
		_uy = -1;

		switch (true) do {
			case ((_relativedir <= 359) && (_relativedir >= 274)): {
				_sinkside = "LEFT FRONT"; 
				_attachpos = [-4.42,  8, -6];
				_uy = -1;
			};
			
			case ((_relativedir >= 0) && (_relativedir <= 94)): {
				_sinkside = "RIGHT FRONT";
				_attachpos = [ 4.42,  8, -6];
				_uy = 1;
			};
			
			case ((_relativedir >= 229) && (_relativedir <= 273)): {
				_sinkside = "LEFT";
				_attachpos = [-4.75, -2, -6];
				_uy = -1;
			};
			
			case ((_relativedir >= 95) && (_relativedir <= 139)): {
				_sinkside = "RIGHT";
				_attachpos = [ 4.42, -2, -6];
				_uy = 1;
			};
			
			case ((_relativedir <= 228) && (_relativedir >= 185)): {
				_sinkside = "LEFT BACK";
				_attachpos = [-4.75, -9, -6];
				_uy = -1;
			};
			
			case ((_relativedir >= 140) && (_relativedir <= 186)): {
				_sinkside = "RIGHT BACK";
				_attachpos = [ 4.42, -9, -6];
				_uy = 1;
			};
		};
		
		_democharge = "SatchelCharge_Remote_Mag_Scripted" createVehicle (getPosATL _target);    
		_democharge attachTo [_target, _attachpos];
		_democharge setVectorDirAndUp [[0, 1, 0], [_uy, 1, 0]];
		
		[IP_Main, "All right, that should do it. Better trigger it from a safe distance.", "DIRECT"] call IP_fnc_simpleSentence;
		
		IP_ChargeDetonated = false;
		_id = _unit addAction ["Detonate Charge", {IP_ChargeDetonated = true;}];
		waitUntil {IP_ChargeDetonated};
		_unit removeAction _id;
		
		_democharge setDamage 1;
        sleep 1;

		_sinktime = 120;
		_smoke = true;
		_x = getCenterOfMass _target select 0;
		_y = getCenterOfMass _target select 1;
		_z = getCenterOfMass _target select 2;
		_z1 = _z + 1.0;
		_z2 = _z + 4.0;
		_z3 = _z + 8.5;
		_smokeloc = [0, 0, -6];

		switch (_sinkside) do
		{
			case "LEFT": 
			{
				_x1 = _x - 1.0; _y1 = _y; 
				_x2 = _x - 1.7; _y2 = _y - 2.5;   
				_x3 = _x - 1.7; _y3 = _y;        
				_smokeloc = [-3, 0, -6];
			};

			case "RIGHT":
			{
				_x1 = _x + 1.0; _y1 = _y;
				_x2 = _x + 1.7; _y2 = _y - 2.5;  
				_x3 = _x + 1.7; _y3 = _y;        
				_smokeloc = [3, 0, -6];
			};

			case "LEFT FRONT": 
			{
				_x1 = _x - 0.6; _y1 = _y + 3.0; 
				_x2 = _x - 1.5; _y2 = _y + 5.0;   
				_x3 = _x - 1.7; _y3 = _y;        
				_smokeloc = [-3, 8, -6];
			};

			case "RIGHT FRONT":
			{
				_x1 = _x + 0.6; _y1 = _y + 3.0; 
				_x2 = _x + 1.5; _y2 = _y + 5.0;   
				_x3 = _x + 1.7; _y3 = _y;        
				_smokeloc = [3, 8, -6];
			};

			case "LEFT BACK": 
			{
				_x1 = _x - 0.4; _y1 = _y - 2.5; 
				_x2 = _x - 1.5; _y2 = _y - 5.0;   
				_x3 = _x - 1.7; _y3 = _y;        
				_smokeloc = [-3, -8, -6];
			};

			case "RIGHT BACK":
			{
				_x1 = _x + 0.4; _y1 = _y - 2.5; 
				_x2 = _x + 1.5; _y2 = _y - 5.0;   
				_x3 = _x + 1.7; _y3 = _y;        
				_smokeloc = [3, -8, -6];
			};
		};

		if (_smoke) then
		{
			_smoke_e = "#particlesource" createVehicle getPosATL _target;
			_smoke_e setParticleClass "BigDestructionSmoke";
			_smoke_e attachTo [_target, _smokeloc];
		};

		sleep 2;

		_target setCenterOfMass [[_x1, _y1, _z1], _sinktime * 0.33];
		_target setMass [1500000, _sinktime * 0.33];

		sleep (_sinktime * 0.33 + 0.5);

		if (_smoke) then {
			_smoke_e spawn {
				sleep 3;
				deleteVehicle _this;
			}; 
		};
		_target setCenterOfMass [[_x2, _y2, _z2], _sinktime * 0.66];
		_target setMass [3300000, _sinktime * 0.66];

		sleep (_sinktime * 0.66 + 0.5);

		_target setCenterOfMass [[_x3, _y3, _z3], _sinktime];
		_target setMass [7000000, _sinktime];

		waitUntil {(getPosATL _target) select 2 < 7};
		sleep 20;
		_target enableSimulation false;
	};
}
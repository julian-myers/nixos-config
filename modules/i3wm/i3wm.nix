{ config, pkgs, ... }:
{
	
	xsession.windowManager.i3 = {
		enable = true;
		config = {
			gaps = {
				outer = 5;
				inner = 5;
			};
		}; 
	};

}

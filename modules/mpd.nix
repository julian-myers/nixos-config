{ config, pkgs, ... }:
{
	services.mpd = {
		enable = true;
	};

	services.mopidy = {
		enable = true;

		extensionPackages = [
			mopidy-spotify
			mopidy-mpd
		];

		settings = {
			spotify = {
				client_id = "0be83191-6ee1-47d9-99ec-ec971cf0584d";
				client_secret = "HIl93OlJM0tz2ndnE9saV6YUplSrc7oYwDmwYPUX2Lk=";
			};
		};
	};
}

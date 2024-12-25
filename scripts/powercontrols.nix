{ pkgs }:

pkgs.writeShellScriptBin "poweroptions" ''
	usage() {
		echo "Usage: $0 [--reboot | --shutdown | --sleep]"
		exit 1
	}

	if [ $# -ne 1 ]; then 
		usage
	fi

	case $1 in 
		--reboot)
			echo "rebooting!"
			reboot
			;;
		--shutdown)
			echo "Shutting down the system..."
			poweroff
			;;
		--sleep)
			echo "sleeping..."
			systemctl suspend
			;;
		*)
			echo "Invalid option: $1"
			usage
			;;
	esac
''

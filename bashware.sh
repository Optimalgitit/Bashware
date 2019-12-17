# everything below is bashware.

# bashware - when upgrading your version, please erase everything below

# options/config

greeter=true # set this to false to turn off the greeter
customps1=true # set this to false if you want the default PS1
customps2=true # set this to false if you want the default PS2
customps3=true # set this to false if you want the default PS3
customps4=true # set this to false if you want the default PS4

# some variables

bashutilfo="$(tput setaf 1)bashware $(tput setaf 2)0.1 beta$(tput sgr0)"

# greeter
if [[ $greeter == true ]]; then
	echo "${bashutilfo}"
fi

# custom ps variables
if [[ $customps1 == true ]]; then
	PS1="\n$(tput setaf 1)|---ubuntu-$(tput setaf 6)xfce $(tput setaf 4)\t \d\n$(tput setaf 1)|--$(tput setaf 3)${debian_chroot:+($debian_chroot)}\u@\h:$(tput setaf 5)\w\$$(tput setaf 1)\n|-$(tput sgr0)"
fi

if [[ $customps2 == true ]]; then
	PS2="$(tput setaf 3)\u@\h :: $(tput setaf 5)${LINENO} | $(tput sgr0) "
fi

if [[ $customps3 == true ]]; then
	PS3="$(tput setaf 1)Make selection: $(tput sgr0)"
fi

if [[ $customps4 == true ]]; then
	PS4="$(tput setaf 1)Line ${LINENO}: $(tput sgr0)"
fi

# correct you if you type in bashware

function bashware () {
	echo "Did you mean bashutils?"
}

# bashwareutils

function bashutils () {
	if [[ $# == 0 ]]; then
		echo "
Please use bashutils --help for help."
	elif [[ $1 == "--help" ]] || [[ $1 == "-h" ]]; then
		if [[ $2 == "ps1" ]]; then
			echo "
PS1 Options:
	
bashutils ps1 reset - resets PS1 to default
bashutils ps1 custom - sets PS1 to bashware's own custom PS1"
		elif [[ -z $2 ]]; then
			echo "
${bashutilfo}
--version - Display the bashutils version
ps1 - Customise your PS1"
		else
			echo "Invalid Option"
		fi
	elif [[ $1 == "--version" ]] || [[ $1 == "-v" ]]; then
		echo "
${bashutilfo}"
	elif [[ $1 == "ps1" ]]; then
		if [[ $2 == "reset" ]]; then
			PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
		elif [[ $2 == "custom" ]]; then
			PS1="\n$(tput setaf 1)|---ubuntu-$(tput setaf 6)xfce $(tput setaf 4)\t \d\n$(tput setaf 1)|--$(tput setaf 3)${debian_chroot:+($debian_chroot)}\u@\h:$(tput setaf 5)\w\$$(tput setaf 1)\n|-$(tput sgr0)"
		elif [[ -z $2 ]]; then
			echo "
PS1 Options:

bashutils ps1 reset - resets PS1 to default
bashutils ps1 custom - sets PS1 to bashware's own custom PS1"
		else
			echo "Invalid Option"
		fi
	elif [[ $1 == "greet" ]]; then
		echo "${bashutilfo}"
	else
		echo "Invalid Option"	
	fi
}
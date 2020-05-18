# this script is designed to test and install if possible minimumly required applications for software development.  It will also add in several additional applications like firefox and vlc


if (!(test-path "C:\ProgramData\chocolatey") -and $IsWindows)
{
	write-host 'Chocolately is not installed on this system.  Please do so by elevating your shell with admin privileges by executing "start-process powershell -verb runas" and running the command "install-choco".' -foregroundcolor black -backgroundcolor red
}
elseif (!(get-command "brew" -erroraction silentlycontinue) -and $IsMacOS)
{
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}
else
{
	if (!(get-command "dotnet" -erroraction silentlycontinue))
	{
		if ($IsWindows)
		{
			write-host 'Dotnet SDK is not installed on this system.  Please do so by elevating your shell with admin privileges by executing "start-process powershell -verb runas" and searching for the latest version with "choco search dotnet-sdk".' -foregroundcolor black -backgroundcolor red
		}
		elseif ($IsLinux)
		{
			write-host 'Dotnet SDK is not isntalled on this system.  Please do so per Microsofts instructions for your distro' -foregroundcolor black -backgroundcolor red
		}
		else
		{
			brew install dotnet-sdk
		}
	}

	if (!(get-command "git" -erroraction silentlycontinue))
	{
		if ($IsWindows)
		{
			start-process choco -argumentlist "install git -y" -verb runas
		}
		elseif ($IsLinux)
		{
			write-host 'Git is not installed on this system.  Please do so per your distros package manager.' -foregroundcolor black -backgroundcolor red
		}
		else
		{
			brew install git
		}
	}
	
	if (!(get-command "vim" -erroraction silentlycontinue))
	{
		if ($IsWindows)
		{
			start-process choco -argumentlist "install vim -y" -verb runas
		}
		elseif ($IsLinux)
		{
			write-host "Vim is not installed on this system.  Please do so per your distro's package manager." -foregroundcolor black -backgroundcolor red
		}
		else
		{
			brew install vim
		}
	}

	if (!(get-command "vscodium" -erroraction silentlycontinue))
	{
		if ($IsWindows)
		{
			start-process choco -argumentlist "install vscodium -y" -verb runas
		}
		elseif ($IsLinux)
		{
			write-host "VSCodium is not installed on this system.  Please do so per your distro's package manager." -foregroundcolor black -backgroundcolor red
		}
		else
		{
			brew isntall vscodium
		}
	}

	if (!(get-command "winscp" -erroraction silentlycontinue) -and $IsWindows)
	{
		start-process choco -argumentlist "install winscp -y" -verb runas
	}

	if (!(get-command "pwsh" -erroraction silentlycontinue))
	{
		if ($IsWindows)
		{
			start-process choco -argumentlist "install pwsh -y" -verb runas
		}
		elseif ($IsLinux)
		{
			if (get-command "dotnet" -erroraction silentlycontinue)
			{
				dotnet tool install -g PowerShell
			}
			else
			{
				write-host 'Powershell Core is not installed on this system.  Please install dotnet core and run hte following command "dotnet tool install -g PowerShell" or install powershell core via Microsofts instructions for your linux distro.' -foregroundcolor black -backgroundcolor red
			}
		}
		else
		{
			brew install powershell
		}
	}

	if (!(test-path "C:\Program Files\VideoLAN\VLC -erroraction silentlycontinue) -or !(get-command "vlc" -erroraction silentlycontinue))
	{
		if ($IsWindows)
		{
			start-process choco -argumentlist "install vlc -y" -verb runas
		}
		elseif ($IsLinux)
		{
			write-host "VLC is not installed on this system.  Please install it through your distro's package manager" -foregroundcolor black -backgroundcolor red
		}
		else
		{
			brew install vlc
		}
	}

	if (!(test-path "C:\Program Files (86x)\Mozilla Firefox" -erroraction silentlycontinue) -or !(get-command "firefox" -erroraction silentlycontinue))
	{
		if ($IsWindows)
		{
			start-process choco -argumentlist "install firefox -y" -verb runas
		}
		elseif ($IsLinux)
		{
			write-host "Firefox is not installed on this system.  Please install it through your distro's package manager" -foregroundcolor black -backgroundcolor red
		}
		else
		{
			brew install firefox
		}
	}
}



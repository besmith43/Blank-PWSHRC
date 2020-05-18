param ()

# install powershell 5 profile

if ($IsWindows)
{
	if (!(test-path "~\Documents\WindowsPowerShell"))
	{
		new-item -itemtype Directory -path "~\Documents\WindowsPowerShell"
	}

	copy-item -path .\Profile.ps1 -destination "~\Documents\WindowsPowerShell"
}

# install powershell core profile
# by using the $profile variable, it places the profile where ever the specific OS needs it to be

if (!(test-path -itemtype file -path $profile))
{
	new-item $profile -force
	remove-item $profile
}

copy-item -path .\Microsoft.PowerShell_profile.ps1 -destination $profile


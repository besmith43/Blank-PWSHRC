if ($IsWindows -and $PSVersionTable.PSEdition -eq "Desktop")
{
	foreach ($WindowsModule in $WindowsModules)
	{
		import-module $WindowsModule -erroraction silentlycontinue
	}
}

# these modules will be imported across both versions and all platforms

foreach ($GeneralModule in $GeneralModules)
{
	import-module $GeneralModule -erroraction silentlycontinue
}



#REQUIRES -Version 2.0

Function Get-Uptime
{
   	<#
   	.Synopsis
		Gets uptimes on server(s)
   	
	.Description
		Gets uptime on a single server or a list of servers.
	
	.Parameter ComputerName 
		The name of the computers(s) to check uptime status of.

   	.Example
		Get-Uptime
		
		Description
		---------------------
		Gets uptime on current server
		
	.Example
		Get-Uptime -ComputerName Server1
		
		Description
		---------------------
		Gets the uptime on a single server named Server1
	
	.Example
		Get-Uptime Server1
				
		Description
		---------------------
		Gets the uptime on a single server named Server1
	
	.Example
		"Server1","Server2" | Get-Uptime 
		
		Description
		---------------------
		Gets the uptime on the servers named Server1 and Server2

	.Example
		$Servers | Get-Uptime
		
		Description
		---------------------
		Gets the uptime of a list of servers contained in a variable called $Servers
		
	.Example 
		Get-Content C:\temp\Serverlist.txt | Get-Uptime
		
		Description
		---------------------		
		Get uptime info on all servers listed in the file C:\temp\Serverlist.txt
		
   	.Link
	   
   	.Notes
    	Author: Johnny Leuthard 
	#>
   	
	[CmdletBinding()]
	Param 
   	(
		[Parameter(ValueFromPipeline=$true,Position=0,Mandatory=$false)]
		$ComputerName = ($Env:COMPUTERNAME)
	)
   	Begin
   	{
	}
   	Process
   	{
		$MyCustomObject = New-Object System.Object
		#$MyCustomObject | Add-Member -type NoteProperty -name ComputerName -Value $ComputerName.ToUpper
		$MyCustomObject | Add-Member -type NoteProperty -name ComputerName -Value $ComputerName.ToUpper().split(".")[0]
		
		#Ping server to verify it is up
		If ($server -ne "")
		{ 
				
			#Test to make sure the server is up.
			$PingTest = Test-Connection -ComputerName $ComputerName -Count 1 -ea 0
			If ($PingTest -eq $Null) #Ping failed
			{
				$MyCustomObject | Add-Member -type NoteProperty -name Days -Value "No Ping"
				$MyCustomObject | Add-Member -type NoteProperty -name Hours -Value "No Ping"
				$MyCustomObject | Add-Member -type NoteProperty -name Minutes -Value "No Ping"
				$MyCustomObject | Add-Member -type NoteProperty -name Seconds -Value "No Ping"
			}
			Else
			{
				#Get the last boot time of the current server
				$LastBoot = Get-WmiObject -class Win32_OperatingSystem -computer $ComputerName
				
				#Convert the last boot time to a readable format 
				$LBTime = $LastBoot.ConvertToDateTime($LastBoot.Lastbootuptime)
				#get the difference between now and the last boot time
				[TimeSpan]$UPTime = New-TimeSpan $LBTime $(get-date)
				
				#Save data into a custom object
				$MyCustomObject | Add-Member -type NoteProperty -name Days -Value $UPTime.days 
				$MyCustomObject | Add-Member -type NoteProperty -name Hours -Value $UPTime.hours 
				$MyCustomObject | Add-Member -type NoteProperty -name Minutes -Value $UPTime.minutes
				$MyCustomObject | Add-Member -type NoteProperty -name Seconds -Value $UPTime.seconds
			}
		
			$MyCustomObject
		}
	}
   	End
   	{ 

 	}

} #End Advanced Function
#Notes
<#


To DO
---------
- save in a variable
- Ability to dump to a file
- ping server first to make sure it is up
- Add a variable that if supplied at the command line it will save failed pings to a text file.
  user a RegEx to validate the syntax and a gest path to make sure the path to save to is there.


Dump to a file
Use a switch and write to a CSV
$Global:UptimeList | % {  $_ }
foreach ($i in $UptimeTemp){$i.split("")[4]}

$UptimeList[0].tostring().replace(" ","`t")


#dump pinglist out to a file
#Check uptime and if outside window save it to a variable
%{ $UptimeList  })[0].split(" ")[0] | out-file c:\Temp\temp.txt


#>


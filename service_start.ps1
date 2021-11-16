#*************************************
#Title: Windows Service Controller
#Author: Naeem Patel
#Date: 2021-11-11
#Version: 1.0
#*************************************

write-Host @"
  ___              _           ___         _           _ _         
 / __| ___ _ ___ _(_)__ ___   / __|___ _ _| |_ _ _ ___| | |___ _ _ 
 \__ \/ -_) '_\ V / / _/ -_) | (__/ _ \ ' \  _| '_/ _ \ | / -_) '_|
 |___/\___|_|  \_/|_\__\___|  \___\___/_||_\__|_| \___/_|_\___|_|  
     
"@

$user_option = 10
while ($user_option -ne 'x') {
    Write-Output "`n"
    Write-Output "##############################"
    Write-Output "Please choose an Option"
    Write-Output "##############################"
    Write-Output "[ 0 ] - Refresh Service List Above"
    Write-Output "[ 1 ] - Start All Services"
    Write-Output "[ 2 ] - Stop All Services"
    Write-Output "[ 3 ] - Start Single Services"
    Write-Output "[ 4 ] - Stop Single Services"
    Write-Output "[ x ] - Exit"

    $service_list = @('SNMPTRAP','RemoteRegistry')
    $user_option = Read-Host -Prompt 'Please select an option '

    if ($user_option -eq 0){
        Write-Output "`n"
        Write-Output "##############################"
        Write-Output "Refreshing Service List Above"
        Write-Output "##############################"
        foreach ($service in $service_list) {
            $a = ([array]::Indexof($service_list,"$service"))
            $status_check = (Get-Service -Name $service).Status
            Write-Output "[$a] $service : $status_check"
         
        
        }
    }

    elseif ($user_option -eq 1) {
        Write-Output "`n"
        Write-Output "##############################"
        Write-Output "Starting all services"
        Write-Output "##############################"
        foreach ($service in $service_list) {
            $a = ([array]::Indexof($service_list,"$service"))
            Start-Service -Name $service
            $status_check = (Get-Service -Name $service).Status
            Write-Output "[$a] $service : $status_check"
        }
 
    }

    elseif ($user_option -eq 2){
        Write-Output "`n"
        Write-Output "##############################"
        Write-Output "Stopping all services"
        Write-Output "##############################"
         foreach ($service in $service_list) {
            $a = ([array]::Indexof($service_list,"$service"))
            Stop-Service -Name $service
            $status_check = (Get-Service -Name $service).Status
            Write-Output "[$a] $service : $status_check"
        }
 
    }

    elseif ($user_option -eq 3){
        Write-Output "`n"
        $service_start = Read-Host -Prompt "Enter the service number you want to start" 
        $g = $service_list[$service_start]
        Write-Output "`n"
        Write-Output "##############################"
        Write-Output "Starting Service $service_start"
        Write-Output "##############################"
        Start-Service -Name $g
        $status_check = (Get-Service -Name $g).Status
        Write-Output "$g : $status_check"
    }

    elseif ($user_option -eq 4){
        Write-Output "`n"
        $service_stop = Read-Host -Prompt "Enter the service number you want to stop"
        $g = $service_list[$service_stop]
        Write-Output "`n"
        Write-Output "##############################"
        Write-Output "Stopping $g Service"
        Write-Output "##############################"
        Stop-Service -Name "$g"
        $status_check = (Get-Service -Name $g).Status
        Write-Output "$g : $status_check"

    }

    elseif ($user_option -eq 'x'){
        Write-Output "`n"
        Write-Output "Hope to see you soon ヽ(´▽`)/ "
        Start-Sleep -Seconds 2
        Exit

    }

    else {
        Write-Output "Please select an option from the list above"
    }
   }
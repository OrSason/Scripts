# This script contain 3 functions
#1. Create-Task [TaskName] [waitInSeconds]  - Creating a task that would get as input name and WaitInSeconds
#the task will open a text file with notepad and repeat it with given WaitInSeconds
param 
([Parameter(Position=0)][string]$TaskName, [Parameter(Position=1)][int]$WaitInSeconds)

Write-Output "For more information type 'help'"

function Create-Task{
    [CmdletBinding()]
    param (
        $TaskName,$WaitInSeconds
    )
    process {
    $action = New-ScheduledTaskAction   -Argument 'c:/test/myTask.ps1'  -Execute 'powershell.exe'
    $trigger = New-ScheduledTaskTrigger -Once -at (Get-Date) -RepetitionInterval (New-TimeSpan -Seconds $WaitInSeconds) 
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $TaskName  -Description "Run and repeat task from input" 
    Start-ScheduledTask $TaskName
    }

}

#2. Get-AllTasks - Print all running tasks

function Get-AllTasks {
    [CmdletBinding()]
    param (  )
    process {
    Get-ScheduledTask |Select-Object TaskName|Sort-Object
    }
}

#3. Change-TaskStatus [TaskName] - Enable/Disable a task depends on task's status

function Change-TaskStatus {
    [CmdletBinding()]
    param ( $TaskName)
    process {
       
        try{

        $task = Get-ScheduledTask $TaskName
        if($task.State -eq 'Ready')
        {
            Stop-ScheduledTask -TaskName $TaskName
            Disable-ScheduledTask -TaskName $TaskName
        }
        elseif($task.State -eq 'Disable')
        {
        Enable-ScheduledTask -TaskName $TaskName
        Start-ScheduledTask -TaskName $TaskName  
        }
    }
    catch{
        Read-Output 'Could not found Proccess' 
    }
    }
}

# print information about the functions and Examples
function Help {
    [CmdletBinding()]
    param (  )
    process {
    Write-Output "Create-Task [TaskName] [waitInSeconds]  - Creating a task that would get as input name and WaitInSeconds"
    Write-Output "Get-AllTasks - Print all running tasks"
    Write-Output "Change-TaskStatus [TaskName] - Enable/Disable a task depends on task's status"
    }
}

#if the user entered both task's name and wait in Seconds lunch Create-task function

try{
if ( $null -ne  $TaskName -and $null -ne $WaitInSeconds)
{
    Create-Task $TaskName $WaitInSeconds
}
}
catch{

Write-Output "No variables entered"
}

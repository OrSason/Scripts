# This script contain 3 functions
#1. Create-Task [TaskName] [waitInSeconds]  - Creating a task that would get as input name and time
#the task will open a text file with notepad and repeat it with given time

function Create-Task{ 
    [CmdletBinding()]
    param (
        $taskName,$time
    )
    process {
    $action = New-ScheduledTaskAction  -Argument 'c:/test/myTask.ps1'  -Execute 'powershell.exe' 
    $trigger = New-ScheduledTaskTrigger -Once -at (Get-Date) -RepetitionInterval (New-TimeSpan -Seconds $time) 
    Register-ScheduledTask -Action $action -Trigger $trigger  -TaskName $taskName  -Description "Run and repeat task from input"
    Start-ScheduledTask myTask
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
    param ( $taskName)
    process {
       
        try{

        $task = Get-ScheduledTask $taskName
        if($task.State -eq 'Ready')
        {
            Stop-ScheduledTask -TaskName $taskName
            Disable-ScheduledTask -TaskName $taskName
        }
        elseif($task.State -eq 'Disable')
        {
        Enable-ScheduledTask -TaskName $taskName
        Start-ScheduledTask -TaskName $taskName  
        }
    }
    catch{
        Read-Host 'Could not found Proccess' 
    }
    }
}



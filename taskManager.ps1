
function Create-Task {
    [CmdletBinding()]
    param (
        $action,$trigger 
    )
    process {
    $action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument 'c:/myTask.ps1' 
    $trigger = New-ScheduledTaskTrigger  -daily -at 21:00
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "myTask" -Description "Run task every 30 seconds"
    }
    
}

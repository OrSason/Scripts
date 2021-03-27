# Scripts
<h5>Contains Scripts for Sela Bootcamp</h5>

<h3>Poweshell:</h3>
<p>
**myTask.ps1** - Contain PS script that create a text file with selected text and open it with notepad
</p>

taskManager.ps1 - Powershell Script, contain 3 functions:

  **Create Task** - creating a scheduled task that run myTask.ps1
	
how to use:

	PS> ./taskmanager.ps1 
	PS> Create Task [Task's name] ["Time In Seconds"]	 
		   


  **Get-AllTasks** - getting all Active Task On the TaskScheduler


  **Change-TaskStatus**- Disable/Enable task by name

	  PS > Change-TaskStatus ["Task's Name"]
	   
	

 




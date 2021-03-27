# Scripts
<h5>Contains Scripts for Sela Bootcamp</h5>

<h2>Poweshell:</h2>
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
	  
	  
<h2>Bash:</h2>

**passwordValidate.sh** - Contain a bash script that check entered input for the following rule:
1. Length – minimum of 10 characters.
2. Contain both alphabet and number.
3. Include both the small and capital case letters.
	   
if one or more rules fail it will display the password in red color and display which rule failed.
if none of them fails it will print the password in green color

how to use?

	$ ./passwordValidate.sh MyAwess0mEPass




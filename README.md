# JPACrudProject - Home Maintenance Tracker App

### Overview
This application was created to allow a user to track home maintenance tasks and
store the tasks in a database. The user can create, edit, and remove tasks as they
wish. Each task has the capability to track a name, description, the last time it was
performed, the next time the task should be performed, and a url link to instructions
on how to perform the task. The application features several tables for the user to
view tasks based on their due date.

### Technologies
* Java for the application code
* mySQL for the database
    * mySQL workbench
* Gradle for dependency management and build automation
* Spring / SpringBoot
* JPA
    * ORM
    * Entity Manager
    * JPQL
* JUnit 5 (Jupiter)
* HTML, CSS, BootStrap 5.0
* JSTL Tag Library
* Object Oriented Programming
  * Encapsulation
  * toString, hashCode, equals
  * Interface
  * Collections and Lists

### How To Run
Upon launch, the application will collect all of the tasks from the database.
The user is displayed several button options that include: Overdue, 7 days, 30 days,
Add new task, and archived tasks. The overdue, 7 days, and 30 days buttons feature
badges that show the user how many tasks are in their respective table. This allows
the user a quick visual representation of what tasks might be upcoming.

* Selecting the Overdue button will drop down a table that shows all of the tasks
  that are marked as active and that do not have a due date or the due date has past.

* Selecting the 7 day button will drop down a table that shows all of the tasks
  that are marked as active and that have a due date equal to todays date or within
  7 days in the future.

* Selecting the 30 day button will drop down a table that shows all of the tasks
  that are marked as active and that have a due date between 8 and 30 days in the
  future.

* Selecting add new task brings up a window for the user to enter data pertaining
  to a task they would like to add. The fields are Task Name, Description, Last
  Completed Date, Next Due Date, a URL entry to link to a website featuring instructions,
  and an active checkbox. The only field that is required is the Task Name.

* Selecting archived tasks will drop down a table that shows all of the tasks that
  are NOT marked as active. This allows the user to track old tasks were once
  relevant but may not be currently. These tasks will not show up in any of the other
  tables irregardless of due date.

All of the dropdown tables only display the Task Name, Date Last Completed, and Next
Due Date. From any of the tables, the user may click the expand button next to a task  
to view all of the details for that task. In the expanded view, all of the fields are
readonly to prevent accidental changes. However, the url is a link that may be clicked
on and the corresponding website will open up in a new tab.

If a user would like to edit a task, they may select the edit button. The same view
will reload but all fields will be editable. Pressing save will update the database
with the new data. Pressing close will discard the changes and return to the main view.
If the user wishes to completely remove a task from the database instead of marking it
as NOT active, a delete button is also provided.

CAUTION: Pressing delete cannot be reversed. The task would manually have to be
re-added by the user.

### Potential Future Implementation
* The ability for the user to specify a repeated interval in which the due date is
  automatically updated based on the last completed date and interval.
* The ability to track supplies required to perform the task.
* The ability to track expected required time to complete to allow the user better
  planning and time management.
* Efficiency improvements to better handle growing databases.

### Lessons Learned
* Frontend design can be extremely time consuming.
* Print statements to the console are a very useful debugging tool.
* By spending a lot of time on some fairly complex Frontend design did teach me
  a lot about how data interacts in various locations of the application.

### Struggles
  I did have some very lengthy debugging sessions especially with getting data to
  interact with multiple modals and the controller. Some of the issues took quite
  a bit of google help while some others were as simple as forgetting a period or
  performing multiple evaluations in an if statement where one of the evaluations
  needed to be evaluated just one position in front of another. It did seem that
  even the small errors took a while to debug.

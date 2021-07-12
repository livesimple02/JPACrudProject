<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="main.css">
<title>Home Maintenance Tracker</title>
</head>


<body>
	<!-- Top Banner in combination with css -->
	<div class="image-container">
		<div class="text">Home Maintenance Tracker</div>
	</div>
	<!-- ---------------------------------- -->

	<div class='container'>

		<!-- Drop down button group -->
		<div class='btn-group-wrap'>
			<div class='btn-group'>
				<button class="btn btn-danger" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseOverdue"
					aria-expanded="true" aria-controls="collapseOverdue">
					<i class="bi bi-chevron-down"></i> Overdue
					<c:if test='${overdueTasks.size() > 0}'>
						<span class="badge bg-light text-dark">${overdueTasks.size()}</span>
					</c:if>
				</button>
				<button class="btn btn-warning" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseSevenDay"
					aria-expanded="true" aria-controls="collapseSevenDay">
					<i class="bi bi-chevron-down"></i> 7 Days
					<c:if test='${sevenDayTasks.size() > 0}'>
						<span class="badge bg-light text-dark">${sevenDayTasks.size()}</span>
					</c:if>
				</button>
				<button class="btn btn-success" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseThirtyDay"
					aria-expanded="true" aria-controls="collapseThirtyDay">
					<i class="bi bi-chevron-down"></i> 30 Days
					<c:if test='${thirtyDayTasks.size() > 0}'>
						<span class="badge bg-light text-dark">${thirtyDayTasks.size()}</span>
					</c:if>
				</button>
				<button class="btn btn-light" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseRemaining"
					aria-expanded="true" aria-controls="collapseRemaining">
					<i class="bi bi-chevron-down"></i> Future
				</button>
				<button class="btn btn-primary" type="button" id="addBtn"
					data-bs-toggle="modal" data-bs-target="#addModal">
					<i class="bi bi-plus-lg"></i> Add Task
				</button>
				<button class="btn btn-light" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseArchived"
					aria-expanded="true" aria-controls="collapseArchived">
					<i class="bi bi-chevron-down"></i> View Archived
				</button>
			</div>
		</div>
		<!-- ----------------------- -->



		<!--  Overdue Task Table -->
		<div class='overdue-table'>
			<div class="collapse" id="collapseOverdue">
				<table class="table table-sm table-striped">
					<thead>
						<tr class="table-danger">
							<th colspan="5">Overdue Tasks</th>
						</tr>
						<tr>
							<th colspan="1"></th>
							<th colspan="2">Task Name</th>
							<th colspan="1">Last Completed</th>
							<th colspan="1">Next Due Date</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${overdueTasks.size() == 0 }">
							<tr>
								<td colspan="5">No Tasks Found</td>
							</tr>
						</c:if>
						<c:if test="${overdueTasks.size() > 0 }">
							<c:forEach var="task" items="${overdueTasks }" varStatus="loop">
								<tr>
									<td>
										<button type="button" class="btn btn-sm"
											data-bs-toggle="modal" data-bs-target="#detailsModal"
											data-bs-name='${task.taskName }'
											data-bs-desc='${task.description }'
											data-bs-lastDate='${task.lastCompletedDate }'
											data-bs-nextDate='${task.nextDueDate }'
											data-bs-instruct='${task.instructionURL }'
											data-bs-activeFlag='${task.activeFlag }'
											data-bs-id='${task.id}'>
											<i class="bi bi-arrow-up-right-square"></i>
										</button>
									</td>
									<td colspan="2">${task.taskName }</td>
									<td colspan="1">${task.lastCompletedDate }</td>
									<td colspan="1">${task.nextDueDate }</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<!-- ------------------------- -->


		<!-- 7 day table -->
		<div class='sevenDay-table'>
			<div class="d-grid"></div>
			<div class="collapse" id="collapseSevenDay">
				<table class="table table-sm table-striped">
					<thead>
						<tr class="table-warning">
							<th colspan="5">Tasks Due Within 7 Days</th>
						</tr>
						<tr>
							<th colspan="1"></th>
							<th colspan="2">Task Name</th>
							<th colspan="1">Last Completed</th>
							<th colspan="1">Next Due Date</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${sevenDayTasks.size() == 0 }">
							<tr>
								<td colspan="5">No Tasks Found</td>
							</tr>
						</c:if>
						<c:if test="${sevenDayTasks.size() > 0 }">
							<c:forEach var="task" items="${sevenDayTasks }">
								<tr>
									<td>
										<button type="button" class="btn btn-sm"
											data-bs-toggle="modal" data-bs-target="#detailsModal"
											data-bs-name='${task.taskName }'
											data-bs-desc='${task.description }'
											data-bs-lastDate='${task.lastCompletedDate }'
											data-bs-nextDate='${task.nextDueDate }'
											data-bs-instruct='${task.instructionURL }'
											data-bs-activeFlag='${task.activeFlag }'
											data-bs-id='${task.id }'>
											<i class="bi bi-arrow-up-right-square"></i>
										</button>
									</td>
									<td colspan="2">${task.taskName }</td>
									<td colspan="1">${task.lastCompletedDate }</td>
									<td colspan="1">${task.nextDueDate }</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<!-- ------------------- -->


		<!-- 30 Day Tasks -->
		<div class='thirtyDay-table'>
			<div class="collapse" id="collapseThirtyDay">
				<table class="table table-sm table-striped">
					<thead>
						<tr class="table-success">
							<th colspan="5">Tasks Due Within 30 Days</th>
						</tr>
						<tr>
							<th colspan="1"></th>
							<th colspan="2">Task Name</th>
							<th colspan="1">Last Completed</th>
							<th colspan="1">Next Due Date</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${thirtyDayTasks.size() == 0 }">
							<tr>
								<td colspan="5">No Tasks Found</td>
							</tr>
						</c:if>
						<c:if test="${thirtyDayTasks.size() > 0 }">
							<c:forEach var="task" items="${thirtyDayTasks }">
								<tr>
									<td>
										<button type="button" class="btn btn-sm"
											data-bs-toggle="modal" data-bs-target="#detailsModal"
											data-bs-name='${task.taskName }'
											data-bs-desc='${task.description }'
											data-bs-lastDate='${task.lastCompletedDate }'
											data-bs-nextDate='${task.nextDueDate }'
											data-bs-instruct='${task.instructionURL }'
											data-bs-activeFlag='${task.activeFlag }'
											data-bs-id='${task.id }'>
											<i class="bi bi-arrow-up-right-square"></i>
										</button>
									</td>
									<td colspan="2">${task.taskName }</td>
									<td colspan="1">${task.lastCompletedDate }</td>
									<td colspan="1">${task.nextDueDate }</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<!-- ----------------------- -->


		<!--  Remaining Task Table -->

		<div class='remaining-table'>
			<div class="collapse" id="collapseRemaining">
				<table class="table table-sm table-striped">
					<thead>
						<tr>
							<th colspan="5">Future Tasks</th>
						</tr>
						<tr>
							<th colspan="1"></th>
							<th colspan="2">Task Name</th>
							<th colspan="1">Last Completed</th>
							<th colspan="1">Next Due Date</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${remainingTasks.size() == 0 }">
							<tr>
								<td colspan="5">No Tasks Found</td>
							</tr>
						</c:if>
						<c:if test="${remainingTasks.size() > 0 }">
							<c:forEach var="task" items="${remainingTasks }">
								<tr>
									<td>
										<button type="button" class="btn btn-sm"
											data-bs-toggle="modal" data-bs-target="#detailsModal"
											data-bs-name='${task.taskName }'
											data-bs-desc='${task.description }'
											data-bs-lastDate='${task.lastCompletedDate }'
											data-bs-nextDate='${task.nextDueDate }'
											data-bs-instruct='${task.instructionURL }'
											data-bs-activeFlag='${task.activeFlag }'
											data-bs-id='${task.id }'>
											<i class="bi bi-arrow-up-right-square"></i>
										</button>
									</td>
									<td colspan="2">${task.taskName }</td>
									<td colspan="1">${task.lastCompletedDate }</td>
									<td colspan="1">${task.nextDueDate }</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<!-- ---------------------------- -->


		<!--  Archived Task Table -->

		<div class='archived-table'>
			<div class="collapse" id="collapseArchived">
				<table class="table table-sm table-striped">
					<thead>
						<tr>
							<th colspan="5" class="table-secondary">Archived Tasks</th>
						</tr>
						<tr class="table-secondary">
							<th colspan="1"></th>
							<th colspan="2">Task Name</th>
							<th colspan="1">Last Completed</th>
							<th colspan="1">Next Due Date</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${archivedTasks.size() == 0 }">
							<tr>
								<td colspan="5">No Tasks Found</td>
							</tr>
						</c:if>
						<c:if test="${archivedTasks.size() > 0 }">
							<c:forEach var="task" items="${archivedTasks }">
								<tr class="table-secondary">
									<td>
										<button type="button" class="btn btn-sm"
											data-bs-toggle="modal" data-bs-target="#detailsModal"
											data-bs-name='${task.taskName }'
											data-bs-desc='${task.description }'
											data-bs-lastDate='${task.lastCompletedDate }'
											data-bs-nextDate='${task.nextDueDate }'
											data-bs-instruct='${task.instructionURL }'
											data-bs-activeFlag='${task.activeFlag }'
											data-bs-id='${task.id }'>
											<i class="bi bi-arrow-up-right-square"></i>
										</button>
									</td>
									<td colspan="2">${task.taskName }</td>
									<td colspan="1">${task.lastCompletedDate }</td>
									<td colspan="1">${task.nextDueDate }</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<!-- ---------------------------- -->
	</div>



	<!-- Details Modal -->
	<div class="modal fade" id="detailsModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<input type="text" class="form-control" id="idNum" name="idNum"
								readonly hidden='true'>
						</div>
						<div class="mb-3">
							<label for="taskName" class="col-form-label">Task Name:</label> <input
								type="text" class="form-control" id="taskName" name="taskName"
								readonly>
						</div>
						<div class="mb-3">
							<label for="description" class="col-form-label">Description:</label>
							<textarea class="form-control" id="description" readonly></textarea>
						</div>
						<div class="mb-3">
							<label for="lastCompleted" class="col-form-label">Last
								Completed:</label> <input type="date" class="form-control"
								id="lastCompleted" readonly>
						</div>
						<div class="mb-3">
							<label for="nextDue" class="col-form-label">Next Due
								Date:</label> <input type="date" class="form-control" id="nextDue"
								readonly>
						</div>
						<div class="mb-3">
							<label for="instructLink" class="col-form-label">Instructions:</label>
							<a id='instructLink' target='_blank'><input type='text'
								class="form-control" id="instructURL" readonly> </a>
						</div>
						<div class="form-check">
							<label for="activeFlag" class="form-label">Active</label> <input
								class="form-check-input" type="checkbox" id="activeFlag"
								disabled>
						</div>



					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-warning" id="editBtn"
						data-bs-dismiss="modal" data-bs-toggle="modal"
						data-bs-target="#editModal">Edit</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ------------------------------- -->






	<!-- Edit Modal -->
	<div class="modal fade" id="editModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
					<form action="deleteTask.do" method=POST id="deleteForm"
						hidden='true'>
						<input type="text" class="form-control" id="idNumDelete"
							name="idNumDelete" readonly hidden='true'>
					</form>
				</div>
				<div class="modal-body">
					<form action="editTask.do" method=POST id="editForm">
						<div class="mb-3">
							<input type="text" class="form-control" id="idNum" name="idNum"
								readonly hidden='true'>
						</div>
						<div class="mb-3">
							<label for="taskName" class="col-form-label">Task Name:</label> <input
								type="text" class="form-control" id="taskName" name="taskName">
						</div>
						<div class="mb-3">
							<label for="description" class="col-form-label">Description:</label>
							<textarea class="form-control" id="description"
								name="description"></textarea>
						</div>
						<div class="mb-3">
							<label for="lastCompleted" class="col-form-label">Last
								Completed:</label> <input type="date" class="form-control"
								id="lastCompleted" name='lastCompleted'>
						</div>
						<div class="mb-3">
							<label for="nextDue" class="col-form-label">Next Due
								Date:</label> <input type="date" class="form-control" id="nextDue"
								name='nextDue'>
						</div>
						<div class="mb-3">
							<label for="instructLink" class="col-form-label">Instructions:</label>
							<input type='text' class="form-control" id="instructURL"
								name='instructURL'>
						</div>
						<div class="form-check">
							<label for="activeFlag" class="form-label">Active</label> <input
								class="form-check-input" type="checkbox" id="activeFlag"
								value="1" name='activeFlag'>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger" id='deleteBtn'
						data-bs-dismiss="modal" form='deleteForm'>Delete</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-success" id="editBtn"
						data-bs-dismiss="modal" form='editForm'>Save</button>
				</div>
			</div>
		</div>
	</div>
	<!-- --------------------------- -->

	<!-- Add Modal -->
	<div class="modal fade" id="addModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Add Task</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="addTask.do" id="newTaskForm" method=POST>
						<div class="mb-3">
							<label for="taskName" class="col-form-label">Task Name:</label> <input
								type="text" class="form-control" id="taskName" name="taskName"
								value="">
						</div>
						<div class="mb-3">
							<label for="description" class="col-form-label">Description:</label>
							<textarea class="form-control" id="description"
								name="description"></textarea>
						</div>
						<div class="mb-3">
							<label for="lastCompleted" class="col-form-label">Last
								Completed:</label> <input type="date" class="form-control"
								id="lastCompleted" name="lastCompleted" value='null'>
						</div>
						<div class="mb-3">
							<label for="nextDue" class="col-form-label">Next Due
								Date:</label> <input type="date" class="form-control" id="nextDue"
								name="nextDue" value='null'>
						</div>
						<div class="mb-3">
							<label for="instructLink" class="col-form-label">Instructions:</label>
							<input type='text' class="form-control" id="instructURL"
								name="instructURL">
						</div>
						<div class="form-check">
							<label for="activeFlag" class="form-label">Active</label> <input
								class="form-check-input" type="checkbox" id="activeFlag"
								value=true name="activeFlag">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-success" id="saveBtn"
						data-bs-dismiss="modal" form="newTaskForm">Save</button>
				</div>
			</div>
		</div>
	</div>
	<!-- --------------------------- -->



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<!-- Details Modal Script -->
	<script>
		var detailsModal = document.getElementById('detailsModal')
		detailsModal.addEventListener('show.bs.modal', function(event) {
			// Button that triggered the modal
			var button = event.relatedTarget
			// Extract info from data-bs-* attributes
			var taskName = button.getAttribute('data-bs-name')
			var description = button.getAttribute('data-bs-desc')
			var lastCompleted = button.getAttribute('data-bs-lastDate')
			var nextDue = button.getAttribute('data-bs-nextDate')
			var instructions = button.getAttribute('data-bs-instruct')
			var activeFlag = button.getAttribute('data-bs-activeFlag')
			var idNum = button.getAttribute('data-bs-id')
			// If necessary, you could initiate an AJAX request here
			// and then do the updating in a callback.
			//
			// Update the modal's content.
			var modalTitle = detailsModal.querySelector('.modal-title')
			var modalBodyTaskName = detailsModal
					.querySelector('.modal-body #taskName')
			var modalBodyDescription = detailsModal
					.querySelector('.modal-body #description')
			var modalBodyLastCompleted = detailsModal
					.querySelector('.modal-body #lastCompleted')
			var modalBodyNextDue = detailsModal
					.querySelector('.modal-body #nextDue')
			var modalBodyInstruct = detailsModal
					.querySelector('.modal-body #instructLink')
			var modalBodyInstructURL = detailsModal
					.querySelector('.modal-body #instructURL')
			var modalBodyActiveFlag = detailsModal
					.querySelector('.modal-body #activeFlag')
			var modalBodyId = detailsModal.querySelector('.modal-body #idNum')

			modalTitle.textContent = 'Detailed View'
			modalBodyTaskName.value = taskName
			modalBodyDescription.value = description
			modalBodyNextDue.value = nextDue
			modalBodyLastCompleted.value = lastCompleted
			modalBodyInstructURL.value = instructions
			modalBodyInstruct.href = instructions
			if (activeFlag == "true") {
				modalBodyActiveFlag.checked = true;
				modalBodyActiveFlag.value = 1;
			} else {
				modalBodyActiveFlag.checked = false;
				modalBodyActiveFlag.value = 0;
			}
			modalBodyId.value = idNum
		})
	</script>
	<!-- ----------------------- -->


	<!-- Edit Modal Script -->
	<script>
		var editModal = document.getElementById('editModal')
		editModal.addEventListener('show.bs.modal', function(event) {
			// Extract info from details modal
			var taskName = document.getElementById('taskName').value
			var description = document.getElementById('description').value
			var lastCompleted = document.getElementById('lastCompleted').value
			var nextDue = document.getElementById('nextDue').value
			var instructions = document.getElementById('instructURL').value
			var activeFlag = document.getElementById('activeFlag').value
			var idNum = document.getElementById('idNum').value
			// If necessary, you could initiate an AJAX request here
			// and then do the updating in a callback.
			//
			// Update the modal's content.
			var modalTitle = editModal.querySelector('.modal-title')
			var modalBodyTaskName = editModal
					.querySelector('.modal-body #taskName')
			var modalBodyDescription = editModal
					.querySelector('.modal-body #description')
			var modalBodyLastCompleted = editModal
					.querySelector('.modal-body #lastCompleted')
			var modalBodyNextDue = editModal
					.querySelector('.modal-body #nextDue')
			var modalBodyInstructURL = editModal
					.querySelector('.modal-body #instructURL')
			var modalBodyActiveFlag = editModal
					.querySelector('.modal-body #activeFlag')
			var modalBodyId = editModal.querySelector('.modal-body #idNum')
			var modalHeaderId = editModal
					.querySelector('.modal-header #idNumDelete')

			modalTitle.textContent = 'Edit Task'
			modalBodyTaskName.value = taskName
			modalBodyDescription.value = description
			modalBodyNextDue.value = nextDue
			modalBodyLastCompleted.value = lastCompleted
			modalBodyInstructURL.value = instructions
			if (activeFlag == 1) {
				modalBodyActiveFlag.checked = true;
				modalBodyActiveFlag.value = 1;
			} else {
				modalBodyActiveFlag.checked = false;
				modalBodyActiveFlag.value = 0;
			}
			modalBodyId.value = idNum
			modalHeaderId.value = idNum
		})
	</script>
	<!-- -------------------------------------- -->


</body>
</html>
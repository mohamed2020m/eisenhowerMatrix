from django.urls import path
from . import views



urlpatterns=[
    path("", views.index, name="index"),
    path("task/<int:task_id>", views.task, name="task"),
    path("completed_Tasks", views.completedTask, name="completed_Tasks"),
    path("create_task", views.CreateTask, name="create_task"),
    path("edit_task/<int:task_id>", views.EditTask, name="edit_task"),
    path("update_task_status/<int:task_id>", views.UpdateTaskStatus, name="update_task_status"),
    path("delete_task/<int:task_id>", views.DeleteTask, name="delete_task"),
    path("delete_task_wajx/<int:task_id>", views.DeleteTaskWithoutAjax, name="delete_task_wajax"),
    path("register", views.register, name="register"),
    path("login", views.login_view, name="login"),
    path("logout", views.logout_view, name="logout"),
]

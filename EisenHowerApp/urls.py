from django.urls import path
from . import views

# app_name = 'EisenhowerApp'

urlpatterns=[
    path("", views.index, name="index"),
    path("completed_Tasks", views.completedTask, name="completed_Tasks"),
    path("create_task", views.CreateTask, name="create_task"),
]
from django.db import models
from django.utils import timezone
from django.contrib.auth.models import AbstractUser

Task_status = [('done', 'Done'), ('in_progress', 'In Progress')]
Valid_quadrants = [('do_first', 'Do First'), ('schedule', 'Schedule'), 
    ('delegate', 'Delegate'), ('dont_do', 'Don\'t do')
]


class Users(AbstractUser):
    pass

class Tasks(models.Model):
    user = models.ForeignKey(Users, on_delete=models.CASCADE, related_name='user_tasks')
    title = models.CharField(max_length=50, null=True)
    quadrant = models.CharField(max_length=8, choices=Valid_quadrants, default=Valid_quadrants[0][0])
    status = models.CharField(max_length=13, choices=Task_status, default=Task_status[1][0])
    description = models.TextField(max_length=500, default="No description")
    created_At = models.DateTimeField(default=timezone.now())
    updated_At = models.DateTimeField(default=timezone.now())

    def __str__(self) -> str:
        return self.title


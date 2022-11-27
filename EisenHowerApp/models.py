from django.db import models
from datetime import datetime

# Create your models here.

Task_status = [('done', 'Done'), ('in_progress', 'In Progress')]
Valid_quadrants = [('do_first', 'Do First'), ('schedule', 'Schedule'), 
    ('delegate', 'Delegate'), ('dont_do', 'Don\'t do')
]

# class Quadrants(models.Model):
#     name = models.CharField(max_length=8, choices=Valid_quadrants)

class Tasks(models.Model):
    title = models.CharField(max_length=50, null=True)
    quadrant = models.CharField(max_length=8, choices=Valid_quadrants, default=Valid_quadrants[0][0])
    status = models.CharField(max_length=12, choices=Task_status, default=Task_status[1][0])
    created_At = models.DateTimeField(default=datetime.now())

    def __str__(self) -> str:
        return self.title

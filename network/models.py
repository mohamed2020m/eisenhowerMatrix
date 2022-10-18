from django.contrib.auth.models import AbstractUser
from django.db import models

class User(AbstractUser):
    pass

class Posts(models.Model):
    poster = models.ForeignKey(User, on_delete= models.CASCADE, related_name='posts')
    likes = models.ManyToManyField(User, related_name='likes')
    content = models.TextField()
    edited = models.BooleanField(default=False)
    createdAt = models.DateTimeField()
    editedAt = models.DateTimeField(null=True, blank=True)

    def __str__(self) -> str:
        return f"this post from {self.poster}, and it got {len(self.likes.all())} likes."

class Followers(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='followers')
    follower = models.ForeignKey(User, on_delete=models.CASCADE, related_name='following')

    def __str__(self):
        return f"{self.follower} is following {self.user}"

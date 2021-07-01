from djongo import models
from location.models import Location
from django.contrib.auth.models import User

class Worker(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, default=None)
    full_name = models.CharField(max_length=255)
    phoneNumber = models.CharField(max_length=255)
    dob = models.DateField()
    worker_location = models.ForeignKey(Location, on_delete=models.DO_NOTHING, related_name='worker_location')
    occupation = models.CharField(max_length=255)
    joined_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.user.username
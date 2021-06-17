from djongo import models
from location.models import Location

class Seeker(models.Model):
    username = models.CharField(max_length=255, unique=True)
    full_name = models.CharField(max_length=255)
    phoneNumber = models.CharField(max_length=255)
    dob = models.DateField()
    location = models.ForeignKey(Location, on_delete=models.DO_NOTHING, related_name='location')
    joined_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.username
from django.db import models
from django.contrib.auth.models import User

class Coordinates(models.Model):
    lat     = models.FloatField()
    lang    = models.FloatField()

class Location(models.Model):
    city        = models.CharField(max_length=255, null=True)
    zipCode     = models.IntegerField(null=True)
    Coordinates = models.ForeignKey(Coordinates, on_delete=models.DO_NOTHING, null=True)

class Account(models.Model):
    USER_TYPE = (
        ('Worker', 'Worker'),
        ('Seeker', 'Seeker')
    )
    user        = models.OneToOneField(User, on_delete=models.CASCADE)
    image       = models.ImageField(upload_to='static', null=True)
    phoneNumber = models.CharField(max_length=32, unique=True, null=True)
    location    = models.ForeignKey(Location, on_delete=models.DO_NOTHING, null=True)
    user_type   = models.CharField(max_length=255, choices=USER_TYPE, null=True)
    created_at  = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.user.username
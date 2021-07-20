from djongo import models
from django.contrib.auth.models import User
from djongo.storage import GridFSStorage
from django.conf import settings

grid_fs_storage = GridFSStorage(collection='myfiles', base_url=''.join([settings.BASE_URL, 'myfiles/']))

class Location(models.Model):
    lat     = models.FloatField()
    lang    = models.FloatField()

class Account(models.Model):
    USER_TYPE = (
        ('Worker', 'Worker'),
        ('Seeker', 'Seeker')
    )
    user        = models.OneToOneField(User, on_delete=models.CASCADE)
    image       = models.ImageField(default='default.jpg', upload_to='profile_pics', storage=grid_fs_storage)
    phoneNumber = models.CharField(max_length=32, unique=True)
    location    = models.ForeignKey(Location, on_delete=models.DO_NOTHING)
    user_type   = models.CharField(max_length=255, choices=USER_TYPE)
    city        = models.CharField(max_length=255)
    zipCode     = models.IntegerField()
    created_at  = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.user.username
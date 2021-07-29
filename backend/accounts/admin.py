from django.contrib import admin
from accounts.models import Account, Location, Coordinates

admin.site.register(Account)
admin.site.register(Location)
admin.site.register(Coordinates)

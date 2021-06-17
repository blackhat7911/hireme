from djongo import models

class MapGrid(models.Model):
    lat = models.FloatField()
    lang = models.FloatField()

class Location(models.Model):
    locationName = models.CharField(max_length=255)
    zipCode = models.IntegerField()
    mapGrid = models.ForeignKey(MapGrid, on_delete=models.DO_NOTHING, related_name='map_grids')

    def __str__(self):
        return self.locationName
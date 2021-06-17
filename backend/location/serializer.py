from rest_framework import serializers
from location.models import Location, MapGrid

class MapGridSerializer(serializers.ModelSerializer):
    class Meta:
        model = MapGrid
        fields = '__all__'

class LocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Location
        fields = '__all__'
        depth = 1

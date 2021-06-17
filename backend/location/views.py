from rest_framework import generics
from django.http.response import JsonResponse
from rest_framework.parsers import JSONParser
from location.models import Location, MapGrid
from location.serializer import LocationSerializer, MapGridSerializer
from django.shortcuts import render

class LocationList(generics.ListCreateAPIView):
    queryset = Location.objects.all()
    serializer_class = LocationSerializer

class LocationDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Location.objects.all()
    serializer_class = LocationSerializer

class MapGridList(generics.ListCreateAPIView):
    queryset = MapGrid.objects.all()
    serializer_class = MapGridSerializer

class MapGridDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = MapGrid.objects.all()
    serializer_class = MapGridSerializer

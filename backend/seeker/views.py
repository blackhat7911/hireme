from rest_framework import generics
from django.http.response import JsonResponse
from rest_framework.parsers import JSONParser
from seeker.models import Seeker
from seeker.serializer import SeekerSerializer
from django.shortcuts import render

class SeekerList(generics.ListCreateAPIView):
    queryset = Seeker.objects.all()
    serializer_class = SeekerSerializer

class SeekerDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Seeker.objects.all()
    serializer_class = SeekerSerializer

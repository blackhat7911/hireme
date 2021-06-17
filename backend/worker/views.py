from rest_framework import generics
from django.http.response import JsonResponse
from rest_framework.parsers import JSONParser
from worker.models import Worker
from worker.serializer import WorkerSerializer
from django.shortcuts import render

class WorkerList(generics.ListCreateAPIView):
    queryset = Worker.objects.all()
    serializer_class = WorkerSerializer

class WorkerDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Worker.objects.all()
    serializer_class = WorkerSerializer

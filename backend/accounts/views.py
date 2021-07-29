from rest_framework.response import Response
from accounts.models import Account, Location, Coordinates
from accounts.serializer import AccountSerializer, LocationSerializer, UserSerializer, CoordinatesSerializer
from rest_framework import permissions
from rest_framework import generics
from django.contrib.auth.models import User

class UserView(generics.ListCreateAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = (permissions.AllowAny,)

    def perform_create(self, serializer):
        new_user = User.objects.create(username=self.request.data.get('username'))
        new_user.set_password(self.request.data.get('password'))
        serializer.save(password=user.password)

class UserDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = (permissions.AllowAny,)

class AccountView(generics.ListCreateAPIView):
    queryset = Account.objects.all()
    serializer_class = AccountSerializer
    permission_classes = (permissions.AllowAny,)

class AccountDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Account.objects.all()
    serializer_class = AccountSerializer
    permission_classes = (permissions.AllowAny,)

class LocationView(generics.ListCreateAPIView):
    queryset = Location.objects.all()
    serializer_class = LocationSerializer
    permission_classes = (permissions.AllowAny,)

class LocationDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Location.objects.all()
    serializer_class = LocationSerializer
    permission_classes = (permissions.AllowAny,)

class CoordinatesView(generics.ListCreateAPIView):
    queryset = Coordinates.objects.all()
    serializer_class = CoordinatesSerializer
    permission_classes = (permissions.AllowAny,)

class CoordinatesDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Coordinates.objects.all()
    serializer_class = CoordinatesSerializer
    permission_classes = (permissions.AllowAny,)





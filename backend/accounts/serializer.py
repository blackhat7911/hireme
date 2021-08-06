from rest_framework import serializers
from accounts.models import Account, Location, Coordinates
from django.contrib.auth.models import User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model  = User
        fields = ('id', 'username', 'email', 'password')

class CoordinatesSerializer(serializers.ModelSerializer):
    class Meta:
        model  = Coordinates
        fields = '__all__'

class LocationSerializer(serializers.ModelSerializer):
    class Meta:
        model  = Location
        fields = '__all__'

class AccountSerializer(serializers.ModelSerializer):
    class Meta:
        model  = Account
        fields = '__all__'
        depth  = 2
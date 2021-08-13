from rest_framework import serializers
from accounts.models import Account, Location, Coordinates
from django.contrib.auth.models import User
from django.contrib.auth.hashers import make_password

class UserSerializer(serializers.ModelSerializer):
    @staticmethod
    def validate_password(password: str) -> str:
        return make_password(password)

    class Meta:
        model  = User
        fields = ('id', 'username', 'email', 'password')

    def create(self, validated_data):
        password = validated_data.pop('password', None)
        instance = self.Meta.model(**validated_data)
        if password is not None:
            instance.set_password(password)
        instance.save()
        return instance

    def update(self, instance, validated_data):
        for attr, value in validated_data.items():
            if attr == 'password':
                instance.set_password(value)
            else:
                setattr(instance, attr, value)
        instance.save()
        return instance

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
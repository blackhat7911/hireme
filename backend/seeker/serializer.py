from rest_framework import serializers
from seeker.models import Seeker

class SeekerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Seeker
        fields = '__all__'
        depth = 2

from rest_framework import  serializers

from tasks import models

class TodoSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Todo 
        fields = '__all__'
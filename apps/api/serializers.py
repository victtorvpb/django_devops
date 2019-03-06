from rest_framework import serializers

from .models import Payload


class PayloadSerializer(serializers.ModelSerializer):
    class Meta:
        model = Payload
        exclude = ("id",)

from rest_framework import viewsets


from .models import Payload
from .serializers import PayloadSerializer


class PayloadApiView(viewsets.ModelViewSet):
    queryset = Payload.objects.all()
    serializer_class = PayloadSerializer

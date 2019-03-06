from django.test import TestCase
from django.urls import reverse
from rest_framework import status

from apps.api.models import Payload
from apps.api.serializers import PayloadSerializer


class TestsPayloadApi(TestCase):
    def test_insert_payload(self):
        data = {
            "nome": "faker name1",
            "sobrenome": "faker lastName",
            "email": "email@email.com",
            "password": "faker password",
            "defaultLanguage": "faker defaultLanguage",
            "dataNascimento": "faker nascimento",
            "endereco": "faker endereco",
            "areasInteresse": "faker areasInteresse",
            "escola": "faker escola",
            "statusEscola": "faker statusEscola",
        }

        url = reverse("api:Payload-list")
        response = self.client.post(url, data=data)
        payload = Payload.objects.get(nome=data.get("nome"))
        serializer = PayloadSerializer(payload)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data, serializer.data)

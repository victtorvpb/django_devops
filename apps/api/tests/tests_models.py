from django.test import TestCase
from apps.api.models import Payload


class TestsPayloadModel(TestCase):
    def test_insert_payload(self):
        payload = Payload.objects.create(
            nome="faker name",
            sobrenome="faker lastName",
            email="email@email.com",
            password="faker password",
            defaultLanguage="faker defaultLanguage",
            dataNascimento="faker nascimento",
            endereco="faker endereco",
            areasInteresse="faker areasInteresse",
            escola="faker escola",
            statusEscola="faker statusEscola",
        )
        self.assertIsNotNone(payload.pk)

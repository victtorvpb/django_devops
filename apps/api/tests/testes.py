from django.test import TestCase
from apps.api.models import Payload


class TestsPayloadModel(TestCase):

    def test_insert_payload(self):
        payload = Payload(nome="faker name",
                          sobrenome="faker lastName",
                          email="email@email.com",
                          password="faker password",
                          defaul_language="faker defaultLanguage",
                          data_nascimento="faker nascimento",
                          endereco="faker endereco",
                          area_interesse="faker areasInteresse",
                          escola="faker escola",
                          status_escola="faker statusEscola")
        payload.save()
        self.assertIsNotNone(payload.pk)

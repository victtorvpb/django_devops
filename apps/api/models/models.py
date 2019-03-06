from django.db import models


class Payload(models.Model):

    nome = models.CharField(max_length=200)
    sobrenome = models.CharField(max_length=200)
    email = models.EmailField()
    password = models.CharField(max_length=200)
    defaul_language = models.CharField(max_length=200)
    data_nascimento = models.CharField(max_length=200)
    endereco = models.CharField(max_length=200)
    area_interesse = models.CharField(max_length=200)
    escola = models.CharField(max_length=200)
    status_escola = models.CharField(max_length=200)

    def __str__(self):
        return f"Nome {self.name} - Sobrenome{self.sobrenome}"

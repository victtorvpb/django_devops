# Generated by Django 2.1.7 on 2019-03-06 00:10

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Payload',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=200)),
                ('sobrenome', models.CharField(max_length=200)),
                ('email', models.EmailField(max_length=254)),
                ('password', models.CharField(max_length=200)),
                ('defaultLanguage', models.CharField(max_length=200)),
                ('dataNascimento', models.CharField(max_length=200)),
                ('endereco', models.CharField(max_length=200)),
                ('areasInteresse', models.CharField(max_length=200)),
                ('escola', models.CharField(max_length=200)),
                ('statusEscola', models.CharField(max_length=200)),
            ],
        ),
    ]

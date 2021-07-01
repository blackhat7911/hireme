# Generated by Django 2.2.13 on 2021-07-01 09:32

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('seeker', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='seeker',
            name='username',
        ),
        migrations.AddField(
            model_name='seeker',
            name='user',
            field=models.OneToOneField(default=None, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]

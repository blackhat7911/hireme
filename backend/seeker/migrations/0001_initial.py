# Generated by Django 2.2.13 on 2021-06-17 13:18

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('location', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Seeker',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=255, unique=True)),
                ('full_name', models.CharField(max_length=255)),
                ('phoneNumber', models.CharField(max_length=255)),
                ('dob', models.DateField()),
                ('joined_date', models.DateTimeField(auto_now_add=True)),
                ('location', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='location', to='location.Location')),
            ],
        ),
    ]
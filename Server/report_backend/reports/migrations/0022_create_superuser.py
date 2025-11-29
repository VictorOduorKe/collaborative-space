from django.db import migrations
from django.contrib.auth import get_user_model
import os

def create_superuser(apps, schema_editor):
    User = get_user_model()
    
    # Get credentials from environment variables
    username = os.environ.get('DJANGO_SUPERUSER_USERNAME', 'admin')
    email = os.environ.get('DJANGO_SUPERUSER_EMAIL', 'admin@example.com')
    password = os.environ.get('DJANGO_SUPERUSER_PASSWORD')
    
    # Only create if superuser doesn't exist and password is provided
    if password and not User.objects.filter(username=username).exists():
        User.objects.create_superuser(
            username=username,
            email=email,
            password=password
        )
        print(f"Superuser '{username}' created successfully!")
    elif not password:
        print("DJANGO_SUPERUSER_PASSWORD not set. Skipping superuser creation.")
    else:
        print(f"Superuser '{username}' already exists.")

class Migration(migrations.Migration):

    dependencies = [
        ('reports', '0021_userauthdetails'),  # This should be your last migration
    ]

    operations = [
        migrations.RunPython(create_superuser),
    ]
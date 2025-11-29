# #!/usr/bin/env bash
# # Exit on error
# set -o errexit

# # Install dependencies
# pip install -r requirements.txt

# # Navigate to the Django project directory
# cd report_backend

# # Collect static files
# python manage.py collectstatic --noinput

# # Run migrations
# python manage.py migrate

# # if [[ $CREATE_SUPERUSER ]]
# # then
# #     python manage.py createsuperuser --no-input
# # fi


#!/usr/bin/env bash
# Exit on error
set -o errexit

# Install dependencies
pip install -r requirements.txt

# Navigate to the Django project directory
cd report_backend

# Collect static files
python manage.py collectstatic --noinput

# Run migrations
python manage.py migrate

# ===============================
# 🔥 Auto-create Django superuser
# ===============================
python manage.py shell << 'EOF'
from django.contrib.auth import get_user_model
import os

User = get_user_model()

username = os.getenv("DJANGO_SUPERUSER_USERNAME")
email = os.getenv("DJANGO_SUPERUSER_EMAIL")
password = os.getenv("DJANGO_SUPERUSER_PASSWORD")

if username and password:
    if not User.objects.filter(username=username).exists():
        User.objects.create_superuser(username=username, email=email, password=password)
        print("✔ Superuser created:", username)
    else:
        print("ℹ Superuser already exists:", username)
else:
    print("⚠ Missing superuser environment variables. Skipping creation.")
EOF

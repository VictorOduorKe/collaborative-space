# SafeSpace Kenya - Backend API

A Django REST Framework backend for SafeSpace Kenya, a Gender-Based Violence (GBV) reporting and support platform that provides incident reporting, counseling services, and community resources.

## 🌟 Features

### Core Functionality
- **Incident Reporting**: Anonymous and identified GBV incident reporting with evidence upload
- **Psychologist Booking System**: Schedule counseling sessions with licensed psychologists
- **Support Services**: Contact messaging, support requests, and nearest service location finder
- **Community Updates & Events**: Platform updates and community event management
- **User Authentication**: Token-based authentication with role-based access control

### Key Modules

#### 1. Reports Management
- Submit incident reports (Sexual Harassment, Assault, Domestic Violence, etc.)
- Upload evidence (images, PDFs)
- Track report status (New, Pending, Completed)
- Anonymous reporting option

#### 2. Psychologist Services
- Psychologist profile management
- Availability scheduling with Google Calendar integration
- Booking management (past/upcoming sessions)
- Session notes and meet links

#### 3. Support System
- Contact message handling
- Support message tracking with status updates
- Email notifications

#### 4. Community Features
- Platform updates publishing
- Event creation and management
- Public-facing event listings

## 🛠️ Technology Stack

- **Framework**: Django 5.1+ with Django REST Framework
- **Database**: PostgreSQL
- **Authentication**: Token-based (DRF TokenAuthentication)
- **File Storage**: Django file handling with media uploads
- **Email**: SMTP email backend
- **External APIs**: Google Calendar API for psychologist scheduling
- **Deployment**: Render (configured with Gunicorn + Uvicorn)

## 📋 Prerequisites

- Python 3.11+
- PostgreSQL 12+
- pip (Python package manager)
- Virtual environment (recommended)

## 🚀 Installation & Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd Server
```

### 2. Create Virtual Environment
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

### 3. Install Dependencies
```bash
pip install -r requirements.txt
```

### 4. Environment Variables
Create a `.env` file in the `report_backend` directory:

```env
# Database Configuration
DB_NAME=your_database_name
DB_USER=your_database_user
DB_PASSWORD=your_database_password
DB_HOST=localhost
DB_PORT=5432

# Django Settings
SECRET_KEY=your-secret-key-here
DEBUG=True

# Email Configuration
EMAIL_BACKEND=django.core.mail.backends.smtp.EmailBackend
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USE_TLS=True
EMAIL_HOST_USER=your-email@gmail.com
EMAIL_HOST_PASSWORD=your-app-password
DEFAULT_FROM_EMAIL=your-email@gmail.com

# Google Calendar API (Optional - for psychologist booking)
GOOGLE_CLIENT_ID=your-google-client-id
GOOGLE_CLIENT_SECRET=your-google-client-secret
```

### 5. Database Setup
```bash
cd report_backend
python manage.py migrate
python manage.py createsuperuser
```

### 6. Collect Static Files
```bash
python manage.py collectstatic --noinput
```

### 7. Run Development Server
```bash
python manage.py runserver
```

The API will be available at `http://localhost:8000`

## 📁 Project Structure

```
Server/
├── report_backend/
│   ├── report_backend/          # Django project settings
│   │   ├── settings.py          # Main settings
│   │   ├── urls.py              # URL routing
│   │   ├── wsgi.py              # WSGI config
│   │   └── asgi.py              # ASGI config
│   ├── reports/                 # Main application
│   │   ├── models.py            # Database models
│   │   ├── views.py             # API views
│   │   ├── serializers.py       # DRF serializers
│   │   └── migrations/          # Database migrations
│   ├── media/                   # User uploads
│   ├── evidence/                # Report evidence files
│   └── manage.py                # Django management
├── requirements.txt             # Python dependencies
├── build.sh                     # Deployment build script
├── render.yaml                  # Render deployment config
└── README.md                    # This file
```

## 🔌 API Endpoints

### Authentication
- `POST /api/auth/register/` - User registration
- `POST /api/auth/login/` - User login
- `GET /api/auth/user/` - Get current user details

### Reports
- `POST /api/reports/` - Submit incident report
- `GET /api/reports/list/` - List all reports (admin)
- `PATCH /api/reports/<id>/` - Update report status
- `GET /api/reports/count/` - Get report statistics

### Psychologists
- `GET /api/psychologists/` - List all psychologists
- `GET /api/psychologists/<user_id>/` - Get psychologist details
- `POST /api/psychologists/<user_id>/bookings/` - Create booking

### Bookings
- `GET /api/bookings/` - List user bookings
- `GET /api/bookings/past/` - Past bookings
- `GET /api/bookings/upcoming/` - Upcoming bookings
- `GET /api/bookings/<id>/` - Booking details

### Availability
- `GET /api/availabilities/` - List psychologist availability
- `POST /api/availabilities/bulk/` - Bulk update availability
- `PATCH /api/availabilities/<id>/` - Update availability slot

### Support & Contact
- `POST /api/contact/` - Submit contact message
- `GET /api/contact-messages/` - List contact messages (admin)
- `GET /api/support-messages/` - List support messages
- `PATCH /api/support-messages/<id>/` - Update support message

### Updates & Events
- `GET /api/public/updates/` - Public platform updates
- `GET /api/public/events/` - Public events listing
- `POST /api/events/` - Create event (admin)
- `PATCH /api/events/<id>/` - Update event

### Utilities
- `GET /api/nearest-services/` - Find nearest support services
- `GET /api/instructions/` - Get platform instructions
- `POST /api/update-credentials/` - Update user credentials

## 🔐 Security Features

- Token-based authentication
- CORS configuration for allowed origins
- CSRF protection
- File upload validation
- Password validation
- Secure database connections
- Environment-based configuration

## 🌐 Deployment

### Render Deployment

The project is configured for deployment on Render:

1. Push code to GitHub
2. Connect repository to Render
3. Configure environment variables in Render dashboard
4. Deploy using `render.yaml` configuration

Build command:
```bash
cd report_backend && pip install -r ../requirements.txt && python manage.py collectstatic --noinput && python manage.py migrate
```

Start command:
```bash
cd report_backend && gunicorn report_backend.wsgi:application
```

### Production Settings

- Set `DEBUG=False` in production
- Configure `ALLOWED_HOSTS` with your domain
- Use PostgreSQL database
- Configure WhiteNoise for static files
- Set up proper email backend

## 🧪 Testing

```bash
python manage.py test
```

## 📦 Key Dependencies

- Django 5.1+
- djangorestframework
- psycopg2-binary (PostgreSQL adapter)
- django-cors-headers
- python-dotenv
- gunicorn
- whitenoise
- google-api-python-client (Calendar integration)
- Pillow (Image processing)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 Database Models

### IncidentReport
- Category, description, location
- Gender, perpetrator details
- Anonymous reporting option
- Evidence file upload
- Status tracking

### PsychologistProfile
- User profile extension
- Bio, specializations, languages
- Google Calendar integration
- License information

### Booking
- Psychologist-client sessions
- Start/end times
- Meet links and notes
- Calendar event integration

### Availability
- Psychologist time slots
- Status (available/booked/unavailable)
- Conflict prevention

### SupportMessage
- User support requests
- Status tracking (unread/read/replied)
- Email notifications

### Event & Update
- Community events
- Platform updates
- Publishing control

## 🐛 Known Issues

- Ensure `.env` file is properly configured before running
- Google Calendar integration requires OAuth setup
- Media files require proper storage configuration in production

## 📧 Support

For support and queries, contact the development team or create an issue in the repository.

## 📄 License

This project is part of SafeSpace Kenya initiative.

---

**Built with ❤️ for SafeSpace Kenya**


# Collaborative Space

This is a web application that provides a safe and supportive space for individuals to connect with psychologists and access mental health resources.

## Features

*   User registration and authentication
*   Browse psychologist profiles
*   Book appointments with psychologists
*   Real-time chat with psychologists
*   Admin dashboard for managing users and appointments
*   Emergency contact information
*   SGBV reporting and support

## Technologies Used

### Frontend

*   React
*   Vite
*   Tailwind CSS
*   FullCalendar
*   Leaflet
*   Firebase

### Backend

*   Django
*   Django REST Framework
*   PostgreSQL
*   Firebase Admin

## Installation

### Prerequisites

*   Node.js and npm
*   Python and pip
*   PostgreSQL

### Frontend

1.  Clone the repository:
    ```bash
    git clone https://github.com/VictorOduorKe/collaborative-space.git
    ```
2.  Navigate to the `my-project` directory:
    ```bash
    cd my-project
    ```
3.  Install the dependencies:
    ```bash
    npm install
    ```

### Backend

1.  Navigate to the `Server` directory:
    ```bash
    cd Server
    ```
2.  Create a virtual environment:
    ```bash
    python -m venv venv
    ```
3.  Activate the virtual environment:
    *   On Windows:
        ```bash
        venv\Scripts\activate
        ```
    *   On macOS and Linux:
        ```bash
        source venv/bin/activate
        ```
4.  Install the dependencies:
    ```bash
    pip install -r requirements.txt
    ```
5.  Create a `.env` file and add the following environment variables:
    ```
    SECRET_KEY=<your-secret-key>
    DEBUG=True
    DB_NAME=<your-db-name>
    DB_USER=<your-db-user>
    DB_PASSWORD=<your-db-password>
    DB_HOST=localhost
    DB_PORT=5432
    ```
6.  Run the migrations:
    ```bash
    python manage.py migrate
    ```

## Usage

### Frontend

1.  Start the development server:
    ```bash
    npm run dev
    ```
2.  Open your browser and navigate to `http://localhost:5173`.

### Backend

1.  Start the development server:
    ```bash
    python manage.py runserver
    ```
2.  The backend server will be running at `http://localhost:8000`.

## Deployment

### Frontend

The frontend can be deployed to any static site hosting service, such as Netlify, Vercel, or GitHub Pages.

### Backend

The backend can be deployed to any service that supports Python and PostgreSQL, such as Heroku, Render, or AWS.

The `render.yaml` file in the `Server` directory can be used to deploy the backend to Render.

## Contributors

This project is open for contributions. Please feel free to open an issue or submit a pull request.

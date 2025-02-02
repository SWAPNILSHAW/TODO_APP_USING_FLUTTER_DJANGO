# TODO_APP_USING_FLUTTER_DJANGO
 A TODO APP  WHERE FLUTTER IS USED FOR FRONTEND AND DJANGO AND DJANGO REST FRAMEWORK FOR BACKEND

 # ✅ TODO App using Flutter & Django

This is a simple yet powerful **TODO App** built using **Flutter** for the frontend and **Django** for the backend. It allows users to add, update, and delete tasks while syncing with a Django-powered database.

---

## 🚀 Features

- 📌 Create, update, delete tasks
- 🌐 Backend API powered by Django
- 📱 Mobile-friendly UI with Flutter
- 🔐 User authentication (if implemented)
- 🔄 Sync tasks between multiple devices

---

## 🛠 Tech Stack

- **Frontend**: Flutter (Dart)
- **Backend**: Django (Python)
- **Database**: SQLite / PostgreSQL (optional)
- **API**: Django REST Framework (DRF)

---

## 🔧 Installation & Setup

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/SWAPNILSHAW/TODO_APP_USING_FLUTTER_DJANGO.git
cd TODO_APP_USING_FLUTTER_DJANGO

2️⃣ Backend (Django)
Install Dependencies
bash
Copy
Edit
cd backend
pip install -r requirements.txt
Run Migrations
bash
Copy
Edit
python manage.py migrate
Start the Django Server
bash
Copy
Edit
python manage.py runserver
3️⃣ Frontend (Flutter)
Install Flutter Packages
bash
Copy
Edit
cd frontend
flutter pub get
Run the Flutter App
bash
Copy
Edit
flutter run
🖥 API Endpoints (Backend)
Method	Endpoint	Description
GET	/api/tasks/	Fetch all tasks
POST	/api/tasks/	Create a new task
PUT	/api/tasks/{id}/	Update a task
DELETE	/api/tasks/{id}/	Delete a task
🤝 Contribution Guidelines
Fork the repository 🍴
Create a new branch: git checkout -b feature-branch
Commit your changes: git commit -m "Add new feature"
Push to the branch: git push origin feature-branch
Open a pull request 🚀
📜 License
This project is open-source under the MIT License. Feel free to use and modify it!

🎯 Made with ❤️ by SWAPNILSHAW


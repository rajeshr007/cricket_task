# Setup an Cricket World Project


### 1.Grab a copy of the project.

```
git clone https://github.com/rajeshr007/cricket_task.git
```

### 2.Create a virtual environment and install dependencies.

```
mkvirtualenv vir_cricket
pip install -r requirements.txt
```

### 3.Rename .env.example file to .env .

### 4. Enter your database settings in .env file.
 
### 5.To avoid insert data we export cricket_db.sql in mysql database directly then run

```
python manage.py makemigrations
python manage.py migrate --fake
```

### 5 If need to create a new superuser for the admin.

```
python manage.py createsuperuser
```
### 6. Run the development server to verify everything is working.

```
python manage.py runserver
```

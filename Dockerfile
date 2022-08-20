FROM python:3.7-slim

WORKDIR /app

COPY requirements.txt .

RUN pip3 install -r /app/requirements.txt --no-cache-dir

COPY . .

EXPOSE 8000

# CMD ["python3", "manage.py", "runserver", "0:8000"] 
CMD ["gunicorn", "project.wsgi", "-w", "4", "-t", "600", "-b", "0.0.0.0:8000"] 

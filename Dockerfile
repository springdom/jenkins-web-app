FROM python:3.8-slim
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install -r requirement.txt
COPY . .
CMD ["python", "app.py"]

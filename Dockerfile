# Stage 1: Build stage
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Django project files
COPY . .

# Stage 2: Production stage
EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
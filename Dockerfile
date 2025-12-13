# Step 1: Use official Python image
FROM python:3.12-slim

# Step 2: Set working directory inside container
WORKDIR /app

# Step 3: Copy all project files into the container
COPY . .

# Step 4: Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Expose port Flask will run on
EXPOSE 5000

# Step 6: Run the Flask app
CMD ["python", "app.py"]
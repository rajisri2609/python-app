# Use an official Python runtime as a parent image
FROM python:3.12.6

# Set the working directory
WORKDIR /usr/src/app

# Copy the requirements file and install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Run tests
CMD ["python", "-m", "unittest", "discover", "-s", "tests"]
FROM python:3.8.5-slim-buster

WORKDIR /app

# copy requirements first (better caching)
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# copy source code
COPY . /app

# install local package separately
RUN pip install -e .        # ← runs after src/ is copied

CMD ["python3", "app.py"]


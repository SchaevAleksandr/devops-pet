# Берем официальный питон-образ
FROM python:3.12-slim

# Создаем рабочую директорию внутри контейнера
WORKDIR /app

# Сначала копируем только зависимости (для кэширования слоев)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Теперь копируем код
COPY app.py .

# Открываем порт
EXPOSE 5000

# Команда запуска
CMD ["python", "app.py"]

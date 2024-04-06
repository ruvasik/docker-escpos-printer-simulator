# Выбираем базовый образ
FROM openjdk:11-jre-slim

# Устанавливаем необходимые пакеты для работы с X11 и базовые шрифты
RUN apt-get update && apt-get install -y \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libfreetype6 \
    libxi6 \
    xfonts-base \
    fontconfig \
    && rm -rf /var/lib/apt/lists/*

# Настраиваем переменные окружения для шрифтов
ENV FONTCONFIG_PATH /etc/fonts

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем JAR-файл в рабочую директорию контейнера
COPY ./binary/ESCPosPrinterSimulator.jar /app/ESCPosPrinterSimulator.jar

# Задаем команду для запуска приложения
CMD ["java", "-jar", "ESCPosPrinterSimulator.jar"]


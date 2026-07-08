# Настройка докер контейнера для ARMv7
FROM --platform=linux/arm/v7 debian:bullseye

RUN apt-get update && \
    apt-get install -y file

CMD ["uname", "-m"]

# Установка Qt5 для сборки приложений
RUN apt-get update && apt-get install -y \
    build-essential \
    qtbase5-dev \
    qt5-qmake \
    qtbase5-dev-tools

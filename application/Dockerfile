FROM ubuntu:22.04
WORKDIR /opt/application
COPY . .
RUN apt update && apt install -y \
    curl gnupg2 python3.10-dev python3.10-venv python3-pip
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list \
    > /etc/apt/sources.list.d/microsoft-prod.list
RUN apt update && \
    ACCEPT_EULA=Y apt install -y msodbcsql18 mssql-tools18 unixodbc-dev
ENV VIRTUAL_ENV=/opt/application/env
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN pip install -Ur requirements.txt
ENV FLASK_APP=app.py
ENV FLASK_RUN_PORT=8080
ENV FLASK_RUN_HOST=0.0.0.0
EXPOSE 8080
CMD ["flask", "run"]

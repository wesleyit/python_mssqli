FROM mcr.microsoft.com/mssql/server:2022-latest
RUN mkdir -p /usr/config
WORKDIR /usr/config
COPY . /usr/config
EXPOSE 1433
ENTRYPOINT ["./entrypoint.sh"]

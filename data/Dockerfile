FROM mcr.microsoft.com/mssql/server:2019-latest

ENV SA_PASSWORD SqlServer123!
ENV ACCEPT_EULA Y

COPY ./data .

ENTRYPOINT [ "/bin/bash", "entrypoint.sh"]

CMD ["/opt/mssql/bin/sqlservr"]
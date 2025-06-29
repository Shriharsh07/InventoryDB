FROM mysql:9

COPY db /app/db
COPY init_db.sh /app/init_db.sh

RUN chmod +x /app/init_db.sh

CMD ["/app/init_db.sh"]

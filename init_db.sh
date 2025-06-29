#!/bin/bash

echo "📡 Waiting for MySQL to be ready..."
sleep 10

echo "⚙️  Applying migrations in /app/db/migrations..."

for f in /app/db/migrations/*.sql; do
  echo "➡️ Running $f"
  mysql -h "$MYSQLHOST" -P "$MYSQLPORT" -u "$MYSQLUSER" -p"$MYSQLPASSWORD" "$MYSQLDATABASE" < "$f"
  if [ $? -ne 0 ]; then
    echo "❌ Migration failed for $f. Exiting."
    exit 1
  fi
done

echo "✅ All migrations completed successfully!"

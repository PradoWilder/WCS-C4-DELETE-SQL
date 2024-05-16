BACKUP DATABASE SuperMoney TO DISK = 'C:\Users\pomai\WCS-Insert_Data\SuperMoneyBackup\SuperMoney_backup.bak';

USE SuperMoney;

BEGIN TRANSACTION;

DELETE FROM logs WHERE "user" = 'hack3r';
;WITH logs_to_delete AS (
    SELECT "id"
    FROM (
        SELECT "id", ROW_NUMBER() OVER (ORDER BY "id") AS rn
        FROM logs
    ) AS numbered_logs
    WHERE rn <= 3
)

DELETE FROM logs

WHERE "id" IN (SELECT "id" FROM logs_to_delete);

COMMIT;

SELECT *FROM logs;
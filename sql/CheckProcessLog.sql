
DECLARE @Primary as nvarchar(128)
        /*Only select top 100 as the table can have millions of records*/
        SELECT TOP 100 *
          FROM dba.dbo.ProcessLog
         ORDER BY ProcessLogID desc
    END
END
USE [dbname]
IF OBJECT_ID('tempdb..#RowCountsAndSizes') IS NOT NULL
    BEGIN
        DROP TABLE #RowCountsAndSizes
    END

CREATE TABLE #RowCountsAndSizes ( TableName NVARCHAR(128)
                                , [rows] CHAR(11)
                                , reserved VARCHAR(18)
                                , data VARCHAR(18)
                                , index_size VARCHAR(18)
                                , unused VARCHAR(18))

  EXEC sp_MSforeachtable 'INSERT INTO #RowCountsAndSizes EXEC sp_spaceused ''?'' '

SELECT TableName
     , CONVERT(bigint,rows) AS NumberOfRows
     , CONVERT(bigint,left(reserved,len(reserved)-3)) AS SizeinKB
  FROM #RowCountsAndSizes
 ORDER BY NumberOfRows DESC
     , SizeinKB DESC
     , TableName

IF OBJECT_ID('tempdb..#RowCountsAndSizes') IS NOT NULL
    BEGIN
        DROP TABLE #RowCountsAndSizes
    END
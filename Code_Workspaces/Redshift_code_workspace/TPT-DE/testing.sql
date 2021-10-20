
select * from public.shishop_find_column_vw;

SELECT 
  DISTINCT tablename 
  --"column" 
FROM PG_TABLE_DEF 
WHERE 
  schemaname = 'execdev' 
  AND "column" ILIKE '%l%';

  show search_path;

  
create or replace view compass.public.shishop_find_column_vw as (

select t.table_schema,

       t.table_name,

       c.column_name

from information_schema.tables t

inner join information_schema.columns c

           on c.table_name = t.table_name

           and c.table_schema = t.table_schema

where c.column_name like '%personal_email_address%'

and t.table_schema in ('execdev')

--  and t.table_schema not in ('information_schema', 'pg_catalog')

and t.table_type = 'BASE TABLE'

order by t.table_schema


) with no schema binding;
select * from pg_user where usename LIKE '%shishop%';



create table test_shishop_temp
as

(select * from public.temp
limit 10 );

select * from test_shishop_temp
limit 2;

select * from test_shishop_temp
limit 2;

select * from udm_tier2.vw_requisition
LIMIT 10;

select * from udm_tier2.vw_requisition
where job_amzr_req_id IN (1484385,1474451,1303493);

select count(*) from TEMP_SHISHOP_VW_REQUISITION;



select colname,filename,err_reason,line_number,err_code from stl_load_errors where query IN (45306197);



/* This DDLs and queries here are used to follow the tutorial section described in the 
   Redshift documentation for semistructured data support */

/* We will use the nested TPC-H schema for all the examples and illustration */

/*customer-orders-lineitem*/
CREATE TABLE customer_orders_lineitem
(c_custkey bigint
,c_name varchar
,c_address varchar
,c_nationkey smallint
,c_phone varchar
,c_acctbal decimal(12,2)
,c_mktsegment varchar
,c_comment varchar
,c_orders super
);

/* Datamodel of documents to be stored in c_orders Super column would be as follows*/
/*
ARRAY < STRUCT < o_orderkey:bigint
                           ,o_orderstatus:string
                           ,o_totalprice:double
                           ,o_orderdate:string
                           ,o_orderpriority:string
                           ,o_clerk:string
                           ,o_shippriority:int
                           ,o_comment:string
                           ,o_lineitems:ARRAY < STRUCT < l_partkey:bigint
                                                         ,l_suppkey:bigint
                                                         ,l_linenumber:int
                                                         ,l_quantity:double
                                                         ,l_extendedprice:double
                                                         ,l_discount:double
                                                         ,l_tax:double
                                                         ,l_returnflag:string
                                                         ,l_linestatus:string
                                                         ,l_shipdate:string
                                                         ,l_commitdate:string
                                                         ,l_receiptdate:string
                                                         ,l_shipinstruct:string
                                                         ,l_shipmode:string
                                                         ,l_comment:string
                                                         >>
                            >> */


/* COPY command to ingest customer_orders_lineitem, Replace IAM role */

COPY customer_orders_lineitem FROM 's3://redshift-downloads/semistructured/tpch-nested/data/json/customer_orders_lineitem' 
REGION 'us-east-1' IAM_ROLE 'arn:aws:iam::xxxxxxxxxxxx:role/Redshift-S3' 
FORMAT JSON 'auto';


/*part*/
CREATE TABLE part
(p
 p_partkey bigint
 ,p_name varchar
 ,p_mfgr varchar
 ,p_brand varchar
 ,p_type varchar
 ,p_size int
 ,p_container varchar
 ,p_retailprice decimal(12,2)
 ,p_comment varchar
 );

/* COPY command to ingest part, Replace IAM role */

COPY part FROM 's3://redshift-downloads/semistructured/tpch-nested/data/json/part' 
REGION 'us-east-1' IAM_ROLE 'arn:aws:iam::xxxxxxxxxxxx:role/Redshift-S3' 
FORMAT JSON 'auto';



/*region-nations*/

/* region_nations table will be loaded later as part of the examples */ 

CREATE TABLE region_nations
(
 r_regionkey smallint
 ,r_name varchar
 ,r_comment varchar
 ,r_nations super
 );

 /* Datamodel of documents to be stored in r_nations Super column would be as follows*/
/* ARRAY < STRUCT < n_nationkey:int,n_name:string,n_comment:string >> */


/*supplier-partsupp*/
CREATE TABLE supplier_partsupp
(
 s_suppkey bigint
 ,s_name varchar
 ,s_address varchar
 ,s_nationkey smallint
 ,s_phone varchar
 ,s_acctbal double precision
 ,s_comment varchar
 ,s_partsupps super
 );


 /* Datamodel of documents to be stored in s_partsupps Super column would be as follows*/
 /* ARRAY <STRUCT < ps_partkey:bigint,ps_availqty:int,ps_supplycost:double,ps_comment:string >> */

/* COPY command to ingest supplier_partsupp, Replace IAM role */

COPY supplier_partsupp FROM 's3://redshift-downloads/semistructured/tpch-nested/data/json/supplier_partsupp' 
REGION 'us-east-1' IAM_ROLE 'arn:aws:iam::xxxxxxxxxxxx:role/Redshift-S3' 
FORMAT JSON 'auto';



/* Loading Semi-Structured data */
/* Parsing of JSON documents and Inserts/Updates to SUPER columns */

INSERT INTO region_nations VALUES(0, 
   'lar deposits. blithely final packages cajole. regular waters are final requests. regular accounts are according to',
   'AFRICA',   
   JSON_PARSE('{
   "r_nations":[
      {
         "n_comment":" haggle. carefully final deposits detect slyly agai",
         "n_nationkey":0,
         "n_name":"ALGERIA"
      },
      {
         "n_comment":"ven packages wake quickly. regu",
         "n_nationkey":5,
         "n_name":"ETHIOPIA"
      },
      {
         "n_comment":" pending excuses haggle furiously deposits. pending, express pinto beans wake fluffily past t",
         "n_nationkey":14,
         "n_name":"KENYA"
      },
      {
         "n_comment":"rns. blithely bold courts among the closely regular packages use furiously bold platelets?",
         "n_nationkey":15,
         "n_name":"MOROCCO"
      },
      {
         "n_comment":"s. ironic, unusual asymptotes wake blithely r",
         "n_nationkey":16,
         "n_name":"MOZAMBIQUE"
      }
   ]
}'));


/* COPY of JSON into a single SUPER column */

CREATE TABLE region_nations_noshred (rdata SUPER);

/* Replace IAM role */
COPY region_nations_noshred FROM 's3://redshift-downloads/semistructured/tpch-nested/data/json/region_nation' 
REGION 'us-east-1' IAM_ROLE 'arn:aws:iam::xxxxxxxxxxxx:role/Redshift-S3' 
FORMAT JSON 'noshred';


SELECT rdata FROM region_nations_noshred;

/* COPY of JSON into multiple columns */

/* Ingest region_nations, Replace IAM role */

COPY region_nations FROM 's3://redshift-downloads/semistructured/tpch-nested/data/json/region_nation' 
REGION 'us-east-1' IAM_ROLE 'arn:aws:iam::xxxxxxxxxxxx:role/Redshift-S3' 
FORMAT JSON 'auto';

SELECT * FROM region_nations limit 1;


/* COPY FROM COLUMNAR FORMATS PARQUET  and ORC */

/* Replace IAM role */

COPY region_nations
FROM 's3://redshift-downloads/semistructured/tpch-nested/data/parquet/region_nation'
REGION 'us-east-1' IAM_ROLE 'arn:aws:iam::xxxxxxxxxxxx:role/Redshift-S3'
FORMAT PARQUET SERIALIZETOJSON(r_nations);

COPY region_nations
FROM 's3://redshift-downloads/semistructured/tpch-nested/data/orc/region_nation'
REGION 'us-east-1' IAM_ROLE 'arn:aws:iam::xxxxxxxxxxxx:role/Redshift-S3'
FORMAT ORC SERIALIZETOJSON(r_nations);


/* Unloading semi-structured data */

/* Replace IAM role and UNLOAD S3 location */

UNLOAD ('SELECT * FROM region_nations')
TO 's3://unload/region_nations/'
IAM_ROLE 'arn:aws:iam::xxxxxxxxxxxx:role/Redshift-S3-Write'
DELIMITER AS '|'
GZIP
ALLOWOVERWRITE;


/* Querying Semistructured Data */

/* Navigation */

SELECT c_orders[0].o_orderkey FROM customer_orders_lineitem;

SELECT cust.c_orders[0].o_orderkey FROM customer_orders_lineitem AS cust;

SELECT count(*) FROM customer_orders_lineitem WHERE c_orders[0]. o_orderkey is not null;

SELECT c_orders[0].o_orderdate,
       c_orders[0].o_orderstatus,
       count(*) 
FROM customer_orders_lineitem 
WHERE c_orders[0].o_orderkey is not null 
GROUP BY c_orders[0].o_orderstatus, 
         c_orders[0].o_orderdate
ORDER BY c_orders[0].o_orderdate;

/* Unnesting */

SELECT c.*, o FROM customer_orders_lineitem c, c.c_orders o;

SELECT c.*, o, l FROM customer_orders_lineitem c, c.c_orders o, o.o_lineitems l;

SELECT c_name,
       orders.o_orderkey as orderkey,
       index as orderkey_index
FROM customer_orders_lineitem c, c.c_orders as orders AT index order by orderkey_index;

/* Dynamic Typing */

SELECT c_orders[0].o_orderkey 
FROM customer_orders_lineitem 
WHERE c_orders[0].o_orderstatus = 'P';

SELECT c_custkey FROM customer_orders_lineitem
WHERE CASE WHEN JSON_TYPEOF(c_orders[0].o_orderstatus) = 'string'
THEN c_orders[0].o_orderstatus::VARCHAR = 'P'
ELSE false END;

SELECT c_orders[0]. o_orderkey FROM customer_orders_lineitem WHERE c_orders[0].o_orderstatus <= 'P';

SELECT c_custkey FROM customer_orders_lineitem
WHERE CASE WHEN JSON_TYPEOF(c_orders[0].o_orderstatus) = 'string'
THEN c_orders[0].o_orderstatus::VARCHAR <= 'P'
ELSE null END;

/* Joins and Aggregations using Dynamic Typing */

SELECT c.c_name
    ,l.l_extendedprice
    ,l.l_discount
FROM customer_orders_lineitem c
    ,c.c_orders o
    ,o.o_lineitems l
    ,supplier_partsupp s
    ,s.s_partsupps ps
WHERE l.l_partkey = ps.ps_partkey
AND c.c_nationkey = s.s_nationkey
ORDER BY c.c_name
;

SELECT c.c_name
    ,l.l_extendedprice
    ,l.l_discount
FROM customer_orders_lineitem c
    ,c.c_orders o
    ,o.o_lineitems l
    ,supplier_partsupp s
    ,s.s_partsupps ps
WHERE CASE WHEN IS_INTEGER(l.l_partkey) AND IS_INTEGER(ps.ps_partkey)
           THEN l.l_partkey::integer = ps.ps_partkey::integer
           WHEN IS_VARCHAR(l.l_partkey) AND IS_VARCHAR(ps.ps_partkey)
           THEN l.l_partkey::varchar = ps.ps_partkey::varchar
           WHEN IS_ARRAY(l.l_partkey) AND IS_ARRAY(ps.ps_partkey)
                AND IS_VARCHAR(l.l_partkey[0]) AND IS_VARCHAR(ps.ps_partkey[0])
                AND IS_INTEGER(l.l_partkey[0]) AND IS_INTEGER(ps.ps_partkey[0])
           THEN l.l_partkey[0]::varchar = ps.ps_partkey[0]::varchar
                AND l.l_partkey[1]::integer = ps.ps_partkey[1]::integer
           ELSE false END
AND c.c_nationkey = s.s_nationkey
ORDER BY c.c_name
;

/* Lax Semantics */

SELECT c.c_orders.something FROM customer_orders_lineitem c;

SELECT c.c_orders[1][1] FROM customer_orders_lineitem c;

SELECT c.c_orders.o_orderstatus::integer FROM customer_orders_lineitem c;

/* Type Introspection */

SELECT JSON_TYPEOF(r_nations) FROM region_nations;

SELECT JSON_TYPEOF(r_nations[0].n_nationkey) FROM region_nations;

SELECT IS_VARCHAR(r_nations[0].n_name) FROM region_nations;

SELECT r_nations[4].n_name FROM region_nations
WHERE CASE WHEN IS_INTEGER(r_nations[4].n_nationkey) 
THEN r_nations[4].n_nationkey::INTEGER = 15
ELSE false END;

/* ORDER BY */

INSERT INTO region_nations VALUES 
(100,'name1','comment1','AWS'), 
(200,'name2','comment2',1),
(300,'name3','comment3',ARRAY(1, 'abc', null)),
(400,'name4','comment4',-2.5),
(500,'name5','comment5','Amazon');

SELECT r_nations FROM region_nations where r_regionkey in (100,200,300,400,500) order by r_regionkey;

/* Operators And Functions */
/* Arithmetic Operators */

SELECT (c_orders[0]. o_orderkey + 0.5) * c_orders[0]. o_orderkey / 10 AS math FROM customer_orders_lineitem;

/* Arithmetic Functions */

SELECT FLOOR(x), CEIL(x), ROUND(x)
FROM (SELECT (c_orders[0]. o_orderkey + 0.5) * c_orders[0]. o_orderkey / 10 AS x FROM customer_orders_lineitem);

/* Array functions */

SELECT ARRAY(1, c.c_custkey, null, c.c_name, 'abc') from customer_orders_lineitem c;

SELECT ARRAY_CONCAT(ARRAY(JSON_PARSE('[10001,10002]')),ARRAY(JSON_PARSE('[10003,10004]')));

SELECT SUBARRAY(ARRAY('a', 'b', 'c', 'd', 'e', 'f'), 2, 3);

SELECT x, ARRAY_FLATTEN(x) FROM (SELECT ARRAY(1, ARRAY(2, ARRAY(3, ARRAY()))) AS x);

SELECT c_name FROM customer_orders_lineitem 
WHERE GET_ARRAY_LENGTH(c_orders) = (SELECT MAX(GET_ARRAY_LENGTH(c_orders)) 
                                    FROM customer_orders_lineitem);

SELECT SPLIT_TO_ARRAY('12|345|6789', '|');


/*Super and PartiQL Specific SQL behavior */

/* Lax and strict modes for SUPER */

SET navigate_super_null_on_error=on; --default lax mode for navigation

SET cast_super_null_on_error=on;  --default lax mode for casting

SET parse_super_null_on_error=off; --default strict mode for ingestion


/* Accessing JSON fields with upper case  / Mixed case letters */

SET downcase_delimited_identifier to false;

/* Casting Limitations */

SELECT 5::bool;

SELECT 5::decimal::bool;

SELECT 5::super::bool;

SELECT 5.0::bool;

SELECT 5.0::super::bool;

SELECT o.o_orderdate FROM customer_orders_lineitem c,c.c_orders o;

SELECT JSON_TYPEOF(o.o_orderdate) FROM customer_orders_lineitem c,c.c_orders o;

SELECT o.o_orderdate::date FROM customer_orders_lineitem c,c.c_orders o;

SELECT '2019-09-09'::date::super;

SELECT r_nations FROM region_nations where r_regionkey=300;

SELECT r_nations::varchar FROM region_nations where r_regionkey=300;

SELECT JSON_SERIALIZE(r_nations) FROM region_nations where r_regionkey=300;

/* Array Functions */
--an array of numeric values
select array(1,50,null,100);

--an array of different data types
select array(1,'abc',true,3.14);


--ARRAY_CONCAT
-- concatenating two arrays 
SELECT ARRAY_CONCAT(ARRAY(10001,10002),ARRAY(10003,10004));



-- concatenating two arrays of different types 
SELECT ARRAY_CONCAT(ARRAY(10001,10002),ARRAY('ab','cd'));

--SUBARRAY
SELECT SUBARRAY(ARRAY('a', 'b', 'c', 'd', 'e', 'f'), 2, 3);

--ARRAY FLATTEN
select ARRAY_FLATTEN(ARRAY(ARRAY(1,2,3,4),ARRAY(5,6,7,8),ARRAY(9,10)));

--ARRAY LENGTH
select GET_ARRAY_LENGTH(ARRAY(1,2,3,4,5,6,7,8,9,10));


--SPLIT TO ARRAY
SELECT SPLIT_TO_ARRAY('12|345|6789', '|');


/* BOOLEAN FUNCTIONS */

--IS_DECIMAL_PRECISION
drop table t;
create table t(s super);

insert into t values (3.14159);

select decimal_precision(s) from t;


--IS_DECIMAL_SCALE
drop table t;
create table t(s super);

insert into t values (3.14159);

select decimal_scale(s) from t;

--IS_ARRAY
select is_array(JSON_PARSE('[1,2]'));

--IS_BIGINT
drop table t;
create table t(s super);

insert into t values (5);

select s, is_bigint(s) from t;

--IS_BOOLEAN
drop table t;
create table t(s super);

insert into t values (true);

select s, is_boolean(s) from t;


--IS_CHAR
drop table t;
create table t(s super);

insert into t values (true);

select s, is_char(s) from t;

--IS_DECIMAL
drop table t;
create table t(s super);

insert into t values (1.22);

select s, is_decimal(s) from t;

--IS_FLOAT
drop table t;
create table t(s super);

insert into t values(2.22::FLOAT);

select s, is_float(s) from t;

--IS_INTEGER
drop table t;
create table t(s super);

insert into t values (5);

select s, is_integer(s) from t;

--IS_OBJECT
drop table t;

create table t(s super);

insert into t values (JSON_PARSE('{"name": "Joe"}'));

select s, is_object(s) from t;


--IS_SCALAR
drop table t;

create table t(s super);

insert into t values (JSON_PARSE('{"name": "Joe"}'));

select s, is_scalar(s.name) from t;

--IS_SMALLINT
drop table t;

create table t(s super);

insert into t values (5);

select s, is_smallint(s) from t;


--IS_VARCHAR
drop table t;

create table t(s super);

insert into t values ('abc');

select s, is_varchar(s) from t;


--json_typeof() function

SELECT JSON_TYPEOF(ARRAY(1,2));

SELECT JSON_TYPEOF(JSON_PARSE('{"name":"Joe"}'));


--Shredding into SUPER columns with Amazon Redshift Materialized Views

SELECT c.c_name, o.o_orderstatus
FROM customer_orders_lineitem c, c.c_orders o;


SELECT c.c_name, c.c_orders[0].o_totalprice
FROM customer_orders_lineitem c;


CREATE MATERIALIZED VIEW super_mv distkey(c_custkey) sortkey(c_custkey) AS (
  SELECT c_custkey, o.o_orderstatus, o.o_totalprice, o_idx
  FROM customer_orders_lineitem c, c.c_orders o AT o_idx
);


REFRESH MATERIALIZED VIEW super_mv;

SELECT c.c_name, v.o_orderstatus
FROM customer_orders_lineitem c JOIN super_mv v ON c.c_custkey = v.c_custkey;

SELECT c.c_name, v.o_totalprice
FROM customer_orders_lineitem c JOIN super_mv v ON c.c_custkey = v.c_custkey
WHERE v.o_idx = 0;

ALTER TABLE customer_orders_lineitem
ALTER DISTKEY c_custkey, ALTER SORTKEY (c_custkey);

EXPLAIN
SELECT c.c_name, v.o_orderstatus
FROM customer_orders_lineitem c JOIN super_mv v ON c.c_custkey = v.c_custkey;

--CREATING AMAZON REDSHIFT SCALAR COLUMNS OUT OF THE SHREDDED DATA

SELECT c.c_name, v.o_totalprice
FROM customer_orders_lineitem c JOIN super_mv v ON c.c_custkey = v.c_custkey
WHERE v.o_orderstatus = 'F';

SELECT slice, is_rrscan FROM stl_scan
WHERE query = pg_last_query_id() AND perm_table_name LIKE '%super_mv%';

CREATE MATERIALIZED VIEW super_mv distkey(c_custkey) sortkey(c_custkey, o_orderstatus) AS (
  SELECT c_custkey, o.o_orderstatus::VARCHAR AS o_orderstatus, o.o_totalprice, o_idx
  FROM customer_orders_lineitem c, c.c_orders o AT o_idx
);

SELECT slice, is_rrscan FROM stl_scan
WHERE query = pg_last_query_id() AND perm_table_name LIKE '%super_mv%';







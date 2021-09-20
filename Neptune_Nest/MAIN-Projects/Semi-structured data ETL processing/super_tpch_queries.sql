/* The queries in this SQL are meant for tpch tables created as part of the Redshift SUPER tutorial */

/* SUPER 01.tpch-nested.tpl  - Pricing Summary Report */ 

SELECT l.l_returnflag
    ,l.l_linestatus
    ,sum(l.l_quantity::decimal(12,2)) AS sum_qty
    ,sum(l.l_extendedprice::decimal(12,2)) AS sum_base_price
    ,sum(cast(l.l_extendedprice* (1 - l.l_discount) as decimal(24,4)))  AS sum_disc_price
    ,sum(cast(l.l_extendedprice* (1 - l.l_discount) * (1 + l.l_tax)as decimal(36,6)) ) AS sum_charge
    ,avg(l.l_quantity::decimal(12,2)) AS avg_qty
    ,avg(l.l_extendedprice::decimal(12,2)) AS avg_price
    ,avg(l.l_discount::decimal(12,2)) AS avg_disc
    ,count(*) AS count_order
FROM customer_orders_lineitem c
     ,c.c_orders o
     ,o.o_lineitems l
WHERE l.l_shipdate::date <= date '1998-07-28'
GROUP BY l.l_returnflag
         ,l.l_linestatus
ORDER BY l.l_returnflag
    ,l.l_linestatus;



/* SUPER 03.tpch-nested.tpl - Shipping Priority */

SELECT o.o_orderkey
    ,sum(cast(l.l_extendedprice* (1 - l.l_discount) as decimal(24,4))) AS revenue
    ,o.o_orderdate
    ,o.o_shippriority
FROM customer_orders_lineitem c
    ,c.c_orders o
    ,o.o_lineitems l
WHERE c.c_mktsegment = 'BUILDING'
    AND o.o_orderdate::date < '1997-07-21'
    AND l.l_shipdate::date > '1992-11-13'
GROUP BY o.o_orderkey
    ,o.o_orderdate
    ,o.o_shippriority
ORDER BY revenue DESC
    ,o.o_orderdate LIMIT 10;


/* SUPER 05.tpch-nested.tpl - Local Supplier Volume */


SELECT n.n_name
    ,sum(cast(l.l_extendedprice* (1 - l.l_discount) as decimal(24,4))) AS revenue
FROM customer_orders_lineitem c
    ,c.c_orders o
    ,o.o_lineitems l
    ,supplier_partsupp s
    ,region_nations r
    ,r.r_nations n
WHERE l.l_suppkey = s.s_suppkey
    AND c.c_nationkey = s.s_nationkey
    AND s.s_nationkey = n.n_nationkey
    AND r.r_name = 'AMERICA' 
    AND o.o_orderdate::date >= '1992-01-24'
    AND o.o_orderdate::date < '1998-07-15'
GROUP BY n.n_name
ORDER BY revenue DESC;


/* SUPER 06.tpch-nested.tpl - Forecasting Revenue Change  */


SELECT sum(cast(l.l_extendedprice* l.l_discount as decimal(24,4))) AS revenue
FROM customer_orders_lineitem c
    ,c.c_orders o
    ,o.o_lineitems l
WHERE l.l_shipdate::date >= '1992-02-29'
    AND l.l_shipdate::date < '1998-11-08'
    AND l.l_discount::decimal(12,2) BETWEEN 0.05
        AND 0.07
    AND l.l_quantity < 24;


/* SUPER 10.tpch-nested.tpl - Returned Item Reporting  */

SELECT c.c_custkey
    ,c.c_name 
    ,sum(cast(l.l_extendedprice* (1 - l.l_discount) as decimal(24,4))) AS revenue
    ,c.c_acctbal
    ,n.n_name
    ,c.c_address
    ,c.c_phone
    ,c.c_comment
FROM customer_orders_lineitem c
    ,c.c_orders o
    ,o.o_lineitems l
    ,region_nations r
    ,r.r_nations n
WHERE o.o_orderdate::date >= date '1992-01-30'
    AND o.o_orderdate::date < date '1998-07-15'
    AND l.l_returnflag::varchar = 'R' 
    AND c.c_nationkey = n.n_nationkey
GROUP BY c.c_custkey
    ,c.c_name
    ,c.c_acctbal
    ,c.c_phone
    ,n.n_name
    ,c.c_address
    ,c.c_comment
ORDER BY revenue DESC LIMIT 20;


/* SUPER 12.tpch-nested.tpl - Shipping Modes and Order Priority*/

SELECT l.l_shipmode
    ,sum(CASE
            WHEN o.o_orderpriority::varchar = '1-URGENT'
                OR o.o_orderpriority::varchar = '2-HIGH'
                THEN 1
            ELSE 0
            END) AS high_line_count
    ,sum(CASE
            WHEN o.o_orderpriority::varchar <> '1-URGENT'
                AND o.o_orderpriority::varchar <> '2-HIGH'
                THEN 1
            ELSE 0
            END) AS low_line_count
FROM customer_orders_lineitem c
    ,c.c_orders o
    ,o.o_lineitems l
WHERE l.l_shipmode::varchar IN (
        'MAIL'
        ,'RAIL'
        )
    AND l.l_commitdate < l.l_receiptdate
    AND l.l_shipdate < l.l_commitdate
    AND l.l_receiptdate::date >= '1992-01-30'
    AND l.l_receiptdate::date < '1998-07-15'
GROUP BY l.l_shipmode
ORDER BY l.l_shipmode;


/* SUPER 14.tpch-nested.tpl - Promotion Effect  */

SELECT 100.00 * sum(CASE
            WHEN p.p_type LIKE 'PROMO%'  
                THEN cast(l.l_extendedprice * (1 - l.l_discount) as decimal(24,4))
            ELSE 0.0
            END) / sum(cast(l.l_extendedprice* (1 - l.l_discount) as decimal(24,4))) AS promo_revenue
FROM customer_orders_lineitem c
    ,c.c_orders o
    ,o.o_lineitems l
    ,part p
WHERE l.l_partkey = p.p_partkey
    AND l.l_shipdate::date >= '1992-02-29'
    AND l.l_shipdate::date < '1998-11-08';



/* SUPER 16.tpch-nested.tpl - Parts/Supplier Relationship  */


SELECT p.p_brand
    ,p.p_type
    ,p.p_size
    ,count(DISTINCT s.s_suppkey) AS supplier_cnt
FROM supplier_partsupp s
    ,s.s_partsupps ps
    ,part p
WHERE p.p_partkey = ps.ps_partkey
    AND p.p_brand <> 'Brand#53'
    AND p.p_type NOT LIKE 'STANDARD BURNISHED BRASS%'
    AND p.p_size IN (
        25
        ,22
        ,47
        )
GROUP BY p.p_brand
    ,p.p_type
    ,p.p_size
ORDER BY supplier_cnt DESC
    ,p.p_brand
    ,p.p_type
    ,p.p_size;



/* SUPER 18.tpch-nested.tpl -  Large Volume Customer */

SELECT c.c_name
    ,c.c_custkey
    ,o.o_orderkey
    ,o.o_orderdate
    ,o.o_totalprice
    ,ll.sum_quantity 
FROM customer_orders_lineitem c
    ,c.c_orders o
    ,(
        SELECT sum(l.l_quantity::decimal(12,2)) sum_quantity
        FROM o.o_lineitems l
        ) ll
WHERE ll.sum_quantity > 100
ORDER BY o.o_totalprice DESC
    ,o.o_orderdate LIMIT 100;


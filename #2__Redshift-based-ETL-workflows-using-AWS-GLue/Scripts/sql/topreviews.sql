UNLOAD ('SELECT marketplace, product_category, product_title, review_id, helpful_votes, AVG(star_rating) as average_stars FROM reviews GROUP BY marketplace, product_category, product_title, review_id, helpful_votes ORDER BY helpful_votes DESC, average_stars DESC')
TO 's3://etl-rs-g-databucket-1qgcxeb2m2ko6/testunload/'
iam_role 'arn:aws:iam::457403320578:role/ETL-RS-G-RedshiftRole-T3CUR4SC6852';
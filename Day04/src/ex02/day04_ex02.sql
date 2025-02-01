CREATE VIEW v_generated_dates AS
	SELECT generate_series::DATE AS generated_date
    FROM generate_series('2022-01-01','2022-01-31', '1 day'::INTERVAL)
	ORDER BY generated_date;
    
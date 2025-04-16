WITH civilization_trade_stats AS (
	SELECT
		c.civilization_type,
		COUNT(DISTINCT c.caravan_id) AS total_caravans,
		SUM(tt.value) AS total_trade_value,
		SUM(CASE WHEN cg.type = 'Import' THEN cg.value ELSE -cg.value END) AS trade_balance
	FROM
		caravans c
	JOIN 
		trade_transactions tt ON c.caravan_id = tt.caravan_id
	JOIN
		caravan_goods cg ON c.caravan_id = cg.caravan_id
	GROUP BY
		c.civilization_type
),
trade_stats AS (
	SELECT
		EXTRACT(YEAR FROM c.arrival_date) AS year,
		EXTRACT(QUARTER FROM c.arrival_date) AS quarter,
		SUM(tt.value) AS quarterly_value,
		SUM(CASE WHEN cg.type = 'Import' THEN cg.value ELSE -cg.value END) AS quarterly_balance
	FROM
		caravans c
	JOIN
		trade_transactions tt ON c.caravan_id = tt.caravan_id
	JOIN
		caravan_goods cg ON c.caravan_id = cg.caravan_id
	GROUP BY
		EXTRACT(YEAR FROM c.arrival_date),
		EXTRACT(QUARTER FROM c.arrival_date)
)
SELECT
	COUNT(cts.civilization_type) AS total_trading_partners,
	SUM(cts.total_trade_value) AS all_time_trade_value,
	SUM(cts.trade_balance) AS all_time_trade_balance,
-- 	JSON_OBJECT(
-- 		'civilization_trade_data', (
-- 			SELECT JSON_ARRAYAGG(
-- 				JSON_OBJECT(
-- 					'civilization_type', cts.civilization_type,
-- 					'total_caravans', cts.total_caravans,
-- 					'total_trade_value', cts.total_trade_value,
-- 					'trade_balance', cts.trade_balance
-- 				)
-- 			)
-- 			FROM
-- 				civilization_trade_stats cts
-- 			GROUP BY
-- 				cts.civilization_type
-- 		)
-- 	) AS civilization_data,
	JSON_OBJECT(
		'trade_growth', (
			SELECT JSON_ARRAYAGG(
				JSON_OBJECT(
					'year', ts.year,
					'quarter', ts.quarter,
					'quarterly_value', ts.quarterly_value,
					'quarterly_balance', ts.quarterly_balance
				)
			)
			FROM
				trade_stats ts
		)
	) AS trade_timeline
FROM
	civilization_trade_stats cts
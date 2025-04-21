WITH stats AS (
	SELECT
		COUNT(ca.attack_id) AS total_recorded_attacks,
		COUNT(DISTINCT ca.creature_id) AS unique_attackers,
		SUM(CASE WHEN ca.casualties > 0 THEN 1 ELSE 0 END) AS attacks
	FROM
		creature_attacks ca
)
SELECT
	stats.total_recorded_attacks,
	stats.unique_attackers,
	(stats.attacks / NULLIF(stats.total_recorded_attacks, 0)) * 100 AS overall_defense_success_rate
FROM
	stats 
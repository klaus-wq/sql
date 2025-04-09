WITH squad_stats AS (
    SELECT 
        ms.squad_id,
        ms.name,
        ms.formation_type,
        d.name AS leader_name,
        COUNT(sb.report_id) AS total_battles,
        SUM(CASE WHEN sb.outcome = 'Victory' THEN 1 ELSE 0 END) AS victories
    FROM 
        military_squads ms
	JOIN
		dwarves d ON ms.leader_id = d.dwarf_id
	JOIN
		squad_battles sb ON sb.squad_id = ms.squad_id
	GROUP BY
		 ms.squad_id
),
squad_equipment_stats AS (
	SELECT
		se.squad_id,
		AVG(e.quality) AS avg_equipment_quality
	FROM
		squad_equipment se
    JOIN 
        equipment e ON se.equipment_id = e.equipment_id
	GROUP BY
		se.squad_id
)
SELECT 
    ss.squad_id,
    ss.name,
    ss.formation_type,
    ss.leader_name,
    ss.total_battles,
    ss.victories,
    ROUND((ss.victories / NULLIF(ss.total_battles, 0)) * 100, 2) AS victory_percentage,
    ses.avg_equipment_quality
FROM 
    squad_stats ss
JOIN
	squad_equipment_stats ses
ON
	ss.squad_id = ses.squad_id;
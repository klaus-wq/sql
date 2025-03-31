WITH workshops_general_stats AS (
    SELECT 
        w.workshop_id,
        w.name,
        w.type,
        COUNT(wc.dwarf_id) AS num_craftsdwarves,
        SUM(wp.quantity) AS total_quantity_produced,
        COUNT(p.value) AS total_production_value,
        SUM(wp.quantity) / COUNT(DISTINCT wp.production_date) AS daily_production_rate,
        SUM(wp.quantity) / SUM(wm.quantity) AS value_per_material_unit
    FROM 
        workshops w
    LEFT JOIN 
        workshop_craftsdwarves wc ON w.workshop_id = wc.workshop_id
    LEFT JOIN 
        workshop_products wp ON w.workshop_id = wp.workshop_id
    LEFT JOIN 
        workshop_materials wm ON w.workshop_id = wm.workshop_id
    LEFT JOIN
		products p ON wp.product_id = p.product_id
    GROUP BY 
        w.workshop_id, w.name, w.type, w.quality
),
related_entities AS (
    SELECT 
        w.workshop_id,
        JSON_OBJECT(
            'craftsdwarf_ids', (
                SELECT JSON_ARRAYAGG(wc.dwarf_id)
                FROM workshop_craftsdwarves wc
                WHERE wc.workshop_id = w.workshop_id
            ),
            'product_ids', (
                SELECT JSON_ARRAYAGG(p.product_id)
                FROM products p
                WHERE p.product_id IN (
                    SELECT wp.product_id
                    FROM workshop_products wp
                    WHERE wp.workshop_id = w.workshop_id
                )
            ),
            'material_ids', (
                SELECT JSON_ARRAYAGG(wm.material_id)
                FROM workshop_materials wm
                WHERE wm.workshop_id = w.workshop_id
            ),
            'project_ids', (
                SELECT JSON_ARRAYAGG(p.project_id)
                FROM projects p
                WHERE p.workshop_id = w.workshop_id
            )
        ) AS related_entities
    FROM workshops w
)
SELECT 
    wgs.workshop_id,
    wgs.name,
    wgs.type,
    wgs.num_craftsdwarves,
    wgs.total_quantity_produced,
    wgs.total_production_value,
    wgs.daily_production_rate,
    wgs.value_per_material_unit,
    re.related_entities
FROM 
    workshops_general_stats wgs
JOIN 
    related_entities re ON wgs.workshop_id = re.workshop_id;
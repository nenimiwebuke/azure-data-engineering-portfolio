-- Cluster A: eligibility_gap, centered near [0.9, 0.8, 0.1, 0.05, 0.1] with random jitter
INSERT INTO reconciliation_exceptions (employee_id, exception_type, resolution_notes, notes_embedding)
SELECT
    ((gs % 4) + 1),
    'eligibility_gap',
    'Synthetic eligibility gap exception #' || gs,
    ('[' ||
        round((0.9 + (random() * 0.2 - 0.1))::numeric, 3) || ',' ||
        round((0.8 + (random() * 0.2 - 0.1))::numeric, 3) || ',' ||
        round((0.1 + (random() * 0.2 - 0.1))::numeric, 3) || ',' ||
        round((0.05 + (random() * 0.2 - 0.1))::numeric, 3) || ',' ||
        round((0.1 + (random() * 0.2 - 0.1))::numeric, 3) ||
     ']')::vector
FROM generate_series(1, 1000) AS gs;

-- Cluster B: duplicate_current_eligibility, centered near [0.1, 0.05, 0.9, 0.85, 0.1] with random jitter
INSERT INTO reconciliation_exceptions (employee_id, exception_type, resolution_notes, notes_embedding)
SELECT
    ((gs % 4) + 1),
    'duplicate_current_eligibility',
    'Synthetic duplicate eligibility exception #' || gs,
    ('[' ||
        round((0.1 + (random() * 0.2 - 0.1))::numeric, 3) || ',' ||
        round((0.05 + (random() * 0.2 - 0.1))::numeric, 3) || ',' ||
        round((0.9 + (random() * 0.2 - 0.1))::numeric, 3) || ',' ||
        round((0.85 + (random() * 0.2 - 0.1))::numeric, 3) || ',' ||
        round((0.1 + (random() * 0.2 - 0.1))::numeric, 3) ||
     ']')::vector
FROM generate_series(1, 1000) AS gs;

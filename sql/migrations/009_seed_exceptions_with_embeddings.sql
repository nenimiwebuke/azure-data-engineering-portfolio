-- Cluster A: eligibility gap / timing issues
INSERT INTO reconciliation_exceptions (employee_id, exception_type, resolution_notes, notes_embedding)
SELECT employee_id, 'eligibility_gap',
    'Employee had a 3-day gap between employment period end and eligibility termination; corrected eligibility_end date to match employment record.',
    '[0.9, 0.8, 0.1, 0.05, 0.1]'
FROM employees WHERE employee_number = 'EMP-1001';

INSERT INTO reconciliation_exceptions (employee_id, exception_type, resolution_notes, notes_embedding)
SELECT employee_id, 'eligibility_gap',
    'Timing mismatch found between hire date and eligibility start date, likely caused by delayed benefits enrollment processing; adjusted eligibility_start.',
    '[0.85, 0.75, 0.15, 0.1, 0.05]'
FROM employees WHERE employee_number = 'EMP-1002';

INSERT INTO reconciliation_exceptions (employee_id, exception_type, resolution_notes, notes_embedding)
SELECT employee_id, 'eligibility_gap',
    'Late-arriving termination data caused a temporary eligibility gap in the source feed; reprocessed once employment_periods was updated.',
    '[0.88, 0.82, 0.12, 0.02, 0.08]'
FROM employees WHERE employee_number = 'EMP-1004';

-- Cluster B: duplicate/conflicting current eligibility
INSERT INTO reconciliation_exceptions (employee_id, exception_type, resolution_notes, notes_embedding)
SELECT employee_id, 'duplicate_current_eligibility',
    'Two eligibility_determinations rows were both marked is_current for the same plan due to a retry bug in the upstream benefits engine; deactivated the older row.',
    '[0.1, 0.05, 0.9, 0.85, 0.1]'
FROM employees WHERE employee_number = 'EMP-1003';

INSERT INTO reconciliation_exceptions (employee_id, exception_type, resolution_notes, notes_embedding)
SELECT employee_id, 'duplicate_current_eligibility',
    'Manual data correction introduced a second current eligibility record for the same employee and plan; resolved by flagging the incorrect entry as historical.',
    '[0.05, 0.1, 0.85, 0.9, 0.15]'
FROM employees WHERE employee_number = 'EMP-1001';

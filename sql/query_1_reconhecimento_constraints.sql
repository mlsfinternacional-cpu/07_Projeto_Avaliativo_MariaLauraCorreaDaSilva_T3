SELECT
    ac.owner,
    ac.table_name,
    ac.constraint_name,
    ac.constraint_type,
    acc.column_name,
    ruc.owner AS referenced_owner,
    ruc.table_name AS referenced_table,
    rucc.column_name AS referenced_column
FROM all_constraints ac
JOIN all_cons_columns acc
    ON ac.owner = acc.owner
   AND ac.constraint_name = acc.constraint_name
LEFT JOIN all_constraints ruc
    ON ac.r_owner = ruc.owner
   AND ac.r_constraint_name = ruc.constraint_name
LEFT JOIN all_cons_columns rucc
    ON ruc.owner = rucc.owner
   AND ruc.constraint_name = rucc.constraint_name
WHERE ac.owner = 'HR'
  AND ac.table_name IN ('EMPLOYEES', 'DEPARTMENTS', 'JOBS')
  AND ac.constraint_type IN ('P', 'R')
ORDER BY
    ac.table_name,
    ac.constraint_type,
    acc.column_name;
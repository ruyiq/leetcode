SELECT
    exp.left_operand,
    exp.operator,
    exp.right_operand,
    (CASE
        WHEN exp.operator = "<" THEN IF(var1.value < var2.value, "true", "false")
        WHEN exp.operator = ">" THEN IF(var1.value > var2.value, "true", "false")
        WHEN exp.operator = "=" THEN IF(var1.value = var2.value, "true", "false")
     END) AS value
FROM Expressions AS exp
LEFT JOIN Variables AS var1
    ON exp.left_operand = var1.name
LEFT JOIN Variables AS var2
    ON exp.right_operand = var2.name;
-- Update table with NULL where there is no molecular function defined
UPDATE labels_MF 
SET 
    labels_MF.function = NULL
WHERE
    labels_MF.function = '';

-- How many genes are in the dataset? 
SELECT 
    COUNT(*)
FROM
    sc_expression;
-- How many genes have a "Verified" biological process?
SELECT 
    COUNT(*)
FROM
    labels_bp
WHERE
    validation = 'Verified';
-- How many genes have a "Verified" molecular process?
SELECT 
    COUNT(*)
FROM
    labels_mf
WHERE
    validation = 'Verified';
-- How many genes have a "Verified" cell location?
SELECT 
    COUNT(*)
FROM
    labels_cc
WHERE
    validation = 'Verified';
-- How many different conditions of yeast are there in the database? 
SELECT 
    COUNT(*)
FROM
    new_conditions_annotation;
-- How many different types of secondary conditions of yeast are there in the database?
SELECT 
    new_conditions_annotation.secondary, COUNT(*) AS num_second
FROM
    new_conditions_annotation
GROUP BY new_conditions_annotation.secondary
ORDER BY num_second DESC;
SELECT DISTINCT
    (new_conditions_annotation.ID)
FROM
    new_conditions_annotation
WHERE
    new_conditions_annotation.primary LIKE '%Strain%';
-- What are the different temperatures used in the experiment?
SELECT DISTINCT
    (new_conditions_annotation.primary)
FROM
    new_conditions_annotation
WHERE
    new_conditions_annotation.secondary = 'temperature';
-- How many different conditions used the wild type yeast? 
SELECT 
    new_conditions_annotation.ID
FROM
    new_conditions_annotation
WHERE
    new_conditions_annotation.primary IN ('wildtype' , 'wild type');
-- What is the localization of the verified genes? Group them. 
SELECT 
    labels_cc.localization, COUNT(*) AS num_local
FROM
    labels_cc
WHERE
    labels_cc.validation = 'Verified'
GROUP BY labels_cc.localization
ORDER BY num_local DESC
LIMIT 5;
-- What is the maximum value in the following conditions?
SELECT 
    MAX(IFFABF), MAX(SAASCC), MAX(IFFAFF)
FROM
    sc_expression;
-- What is the average expression for each gene across the conditions above? 
SELECT 
    sc_expression.gene,
    AVG(IFFABF) AS avg_IFFABF,
    AVG(SAASCC) AS avg_SAASCC,
    AVG(IFFAFF) AS avg_IFFAFF
FROM
    sc_expression
GROUP BY sc_expression.gene;
-- What are the genes that have an expression between 50 and 100 for the condition 'IFFABF'?
SELECT 
    gene
FROM
    sc_expression
WHERE
    IFFABF BETWEEN 50 AND 100;
-- Show the genes that have verified molecular_function, biological_process, and cell location?
SELECT 
    sc_expression.gene
FROM
    sc_expression
        JOIN
    labels_MF ON sc_expression.gene = labels_MF.gene
        JOIN
    labels_BP ON sc_expression.gene = labels_BP.gene
        JOIN
    labels_CC ON sc_expression.gene = labels_CC.gene
WHERE
    labels_MF.validation = 'Verified'
        AND labels_BP.validation = 'Verified'
        AND labels_CC.validation = 'Verified';
-- What are some other combinations of conditions that can be made for wildtype yeast gene testing? 
SELECT 
    a.primary AS condition_1,
    a.secondary AS condition_2,
    b.primary AS condition_3,
    b.secondary AS condition_4
FROM
    new_conditions_annotation a
        CROSS JOIN
    new_conditions_annotation b
WHERE
    b.primary = 'wildtype';
-- Combine all of the Primary and Secondary Conditions into 1 Column
SELECT 
    new_conditions_annotation.primary
FROM
    new_conditions_annotation 
UNION SELECT 
    new_conditions_annotation.secondary
FROM
    new_conditions_annotation;
/* Find genes with their
molecular function, biologcal process and cellular locations
*/
SELECT 
    sc_expression.gene,
    labels_MF.function,
    labels_BP.localization,
    labels_CC.localization
FROM
    sc_expression
        JOIN
    labels_MF ON sc_expression.gene = labels_MF.gene
        JOIN
    labels_BP ON sc_expression.gene = labels_BP.gene
        JOIN
    labels_CC ON sc_expression.gene = labels_CC.gene;
-- Categorize genes based on their average 'IFFABF' expression
SELECT 
    sc_expression.gene,
    AVG(sc_expression.IFFABF) AS avg_IFFABF,
    CASE
        WHEN AVG(sc_expression.IFFABF) < 50 THEN 'Low Expression'
        WHEN
            AVG(sc_expression.IFFABF) >= 50
                AND AVG(sc_expression.IFFABF) < 100
        THEN
            'Moderate Expression'
        ELSE 'High Expression'
    END AS expression_category
FROM
    sc_expression
GROUP BY sc_expression.gene;
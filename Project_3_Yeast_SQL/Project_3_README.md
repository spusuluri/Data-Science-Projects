# Yeast Transcriptomics SQL Analysis 

By: Srisatya Pusuluri

[Data](https://www.kaggle.com/datasets/costalaether/yeast-transcriptomics?select=labels_MF.csv)

## Purpose

This project involves the analysis of gene expression data in a MySQL database. The purpose is to perform various queries to extract meaningful information about genes, conditions, and their associations. The project aims to explore gene expression patterns, verify biological processes, and categorize genes based on their expression levels. The README serves as a guide for users to navigate the code, understand the structure of the tables, and explore the diverse functionalities employed for data analysis.


## Table Definitions

### sc_expression Table

- `gene`
-  **Condition Columns**

### new_conditions_annotation Table

- `ID`
- `primary`
- `secondary`

### labels_MF Table

- `gene`
- `validation`
- `function`

### labels_BP Table

- `gene`
- `validation`
- `localization`

### labels_CC Table

- `gene`
- `validation`
- `localization`

## Functions Used

1. **SELECT**
2. **UPDATE**
3. **Aggregation Functions**
4. **JOIN**
5. **CASE**
6. **DISTINCT**
7. **UNION**
8. **CROSS JOIN**
9. **GROUP BY**
10. **HAVING**
11. **BETWEEN**
12. **ORDER BY**
13. **LIMIT**
14. **DESC**
15. **Wildcards**
16. **Window Functions**

## Conclusion 

In conclusion, this project involves the exploration and analysis of gene expression data stored in a MySQL database. The code executes a series of SQL queries to uncover insights into the dataset, ranging from updating table values and counting the number of genes to investigating verified biological processes and categorizing genes based on their expression levels. The overall purpose of the project is to provide a comprehensive understanding of the gene expression dataset, answer specific questions related to gene characteristics and experimental conditions, and facilitate further analysis and interpretation of the biological data.

For detailed code implementations, refer to the SQL file in the folder.

Feel free to explore and adapt the code for further analysis or specific use cases.
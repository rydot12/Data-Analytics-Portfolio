## Overview

This lab focuses on data exploration, indexing, and structural analysis using the `usairports` dataset from the airports package. The assignment reinforces proper data handling techniques in R while emphasizing reproducibility, correct syntax, and avoidance of hard-coded solutions.

All tasks were completed using base R functions, with the only external dependency being the airports package for dataset access.

---

## Objectives

- Load and inspect a dataset from an external R package  
- Examine dataset structure (rows, columns, variable names)  
- Use indexing to extract specific rows and columns  
- Access variables using the `$` operator  
- Compute dataset dimensions and column counts programmatically  
- Generate frequency tables using base R functions  
- Construct vectors and combine them into a data frame  
- Identify object classes in R  

---

## Dataset

The dataset used in this lab is `usairports`, contained within the airports package. The dataset includes structured information about airports in the United States, including ownership and classification variables.

---

## Key Tasks Completed

### Dataset Exploration
- Viewed the first rows of the dataset using `head()`
- Retrieved dataset dimensions using `dim()`
- Extracted the last five rows with selected columns using indexing
- Retrieved column names using `names()`
- Determined the number of variables using `ncol()`
- Accessed specific column names via indexing

### Variable Access and Summary
- Extracted values from the `ownership` variable using the `$` operator
- Calculated the number of observations using `length()`
- Generated a frequency table of airport ownership using `table()`

### Data Structure Creation
- Created multiple character and numeric vectors
- Combined vectors into a structured data frame using `data.frame()`
- Identified the class of the resulting data frame using `class()`

---

## Skills Demonstrated

- Data inspection and structural analysis in R  
- Proper indexing of rows and columns  
- Use of built-in summary functions  
- Creation and manipulation of data frames  
- Adherence to strict coding style standards  
- Writing reproducible, non-hard-coded solutions  

---

## Why This Matters

Understanding how to explore and manipulate structured datasets is fundamental to statistical modeling and data science. Skills developed in this lab directly support:

- Data cleaning and preparation  
- Exploratory data analysis  
- Feature inspection before modeling  
- Reproducible analytical workflows  

This lab strengthens core competencies required for more advanced statistical modeling and applied data analysis tasks.

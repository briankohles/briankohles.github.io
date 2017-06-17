---
layout: post
title: MySQL Quick Reference
date: 2015-03-30
author: Brian Kohles
tags: code database mysql
categories: code
---
mySQL reference - items in {} are optional
--------------------------------------------------------------------------------
SHOW DATABASES
     -show all databases you have access to
    
CREATE DATABASE [database_name]
     -create a new database
    
USE [database_name]
     -select a database to use
    
CREATE TABLE [table_name] ([column_name] [column_type], [column_name2] [column_type2])
     -create a new table
    
SHOW TABLES
     -show all tables in a database

DESCRIBE [table_name]
     -list the properties of a table (including fields &amp; types)
    
LOAD DATA LOCAL INFILE "[filename].txt" INTO TABLE [table_name]
     -load data from a text file into the table
          -the columns in the text file and the table need to be the same order

INSERT INTO [table_name]
VALUES ('[column1_value]','[column1_value2]','[column1_value3]')
     -insert values into a table
    
SELECT [what_to_select]
{AS [alias name]}
FROM [table_name] {[table_alias]}
{WHERE [conditions_to_meet]}
{ORDER BY [column_name] [DESC]}
     -select a set of records
          -DESC == descending order

DELETE FROM [table_name]
     -delete all records in a table

UPDATE [table_name]
SET [column_name] = [value_to_set_to]
WHERE [conditions_to_meet]
     -update a table

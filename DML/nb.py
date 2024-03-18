# Databricks notebook source
# MAGIC %sql
# MAGIC DROP TABLE IF EXISTS stock_list;
# MAGIC CREATE TABLE stock_list using CSV options (path "/FileStore/tables/sprice.csv", header "true")

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from stock_list

# COMMAND ----------

# MAGIC %sql
# MAGIC select * from stock_list

# MAGIC %sql
# MAGIC select * from stock_list

# MAGIC %sql
# MAGIC select * from added_env


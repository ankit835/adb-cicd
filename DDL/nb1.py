# Databricks notebook source
# MAGIC %sql
# MAGIC DROP TABLE IF EXISTS stock_list;
# MAGIC CREATE TABLE stock_list using CSV options (path "/FileStore/tables/sprice.csv", header "true")




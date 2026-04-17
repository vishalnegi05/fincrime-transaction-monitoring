<img width="1536" height="1024" alt="ChatGPT Image Apr 17, 2026, 01_45_41 PM" src="https://github.com/user-attachments/assets/e3edbc28-08b4-482f-9b9e-4741d65cefa8" />
# Financial Crime Transaction Monitoring System (SQL)

## Overview

This project simulates a basic Anti-Money Laundering (AML) transaction monitoring system using SQL. It detects suspicious activities such as structuring, mule (pass-through) accounts, and profile mismatches.

## Features

* Structuring detection (multiple small deposits)
* Mule account detection (pass-through transactions)
* Profile mismatch detection (income vs transaction analysis)
* Rule-based alert generation

## Tools Used

* SQL (MySQL)

## Dataset

The project uses two tables:

* customers: stores customer profile information
* transactions: stores transaction details

## Key SQL Concepts Used

* JOIN
* GROUP BY
* HAVING
* CASE WHEN
* Aggregation functions

## How It Works

The system applies rule-based logic to identify suspicious transaction patterns and generate alerts for high-risk customers.

## Output

The system flags customers based on:

* Structuring
* Pass-through behavior
* Profile mismatch

## Learning Outcome

This project demonstrates practical understanding of AML concepts and SQL-based data analysis for financial crime detection.

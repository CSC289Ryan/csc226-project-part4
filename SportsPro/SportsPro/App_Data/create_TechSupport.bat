@ECHO off

:: batch file for
:: Murach's ASP.NET 4.6 Web Programming with C# 2015 Instructor's Guide
:: company: Mike Murach & Associates, Inc.
:: date: August 2, 2016
:: 
:: Uses SQLCMD utility to run a SQL script that creates
:: the TechSupport database.

ECHO Attempting to create the TechSupport database . . . 
sqlcmd -S localhost\SQLExpress -E /i create_TechSupport.sql
ECHO.
ECHO If no error message is shown, then the database was created successfully.
ECHO.
PAUSE
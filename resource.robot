*** Settings ***
Documentation    Suite description
Library         RequestsLibrary     WITH NAME   Req
Library         PostgreSQLDB        WITH NAME   DB
Library         Collections         WITH NAME   Col
Library    categories.Categories     WITH NAME    Cat
Library    categories_rest.Categories_rest      WITH NAME    Catdb
Library    JsonValidator

*** Keywords ***
connect to local host
    Req.Create session       alias       http://localhost:3000
connect to db
    DB.Connect To Postgresql      hadb    ha    password2021dljfklkla1!kljf;    localhost  8432
disconnect from post
    Req.Delete All Sessions
disconnect to local db
    DB.Disconnect From Postgresql
*** Settings ***
Documentation    Suite description
Resource         ../Resource_main/resource.robot

*** Keywords ***
connect to local host
    Req.Create session            alias       http://localhost:3000
connect to db
    DB.Connect To Postgresql      hadb    ha    password2021dljfklkla1!kljf;    localhost  8432
disconnect from post
    Req.Delete All Sessions
disconnect to local db
    DB.Disconnect From Postgresql

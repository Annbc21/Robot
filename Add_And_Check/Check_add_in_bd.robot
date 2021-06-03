*** Settings ***
Resource                Resource.robot
Documentation           Check correctly connect to rest and bd; check ability to add database entry
Metadata                Тест              1.1
Metadata                Автор             Кузнецова Анна
Metadata                Задача            http://ya.ru/CLM-1235463
Force Tags              positive
Default Tags            defaults
Test Setup              Test Setup
Test Teardown           Test Teardown
Test Timeout            5s
*** Test Cases ***
From two tables
    [Tags]              Two tables
    [Documentation]     Проверка выбора двух таблиц через Rest
    ${resp}             Catdb.get title and category      alias=alias   params=select=title,actor,categories(categoryname)&title=like.ACADEMY_ICE*
    ${resp_db}          Cat.get title and category from db
    Col.Lists Should Be Equal     ${resp}      ${resp_db[0]}

Create and check
    [Tags]              Postgrest add
    [Documentation]     Проверка добавления нового поля через Rest
    &{data}=            Create dictionary    category=99     categoryname=test
    catdb.post data from rest    alias=alias     data=${data}
    ${category_list}    Catdb.get price products via params     alias=alias      params=select=category,categoryname&category=eq.99
    ${result}           Cat.get categories by category     category=${99}
    ${req}=             Req.Delete On Session     alias     /categories?      params=select=category,categoryname&category=eq.99
    Col.Lists Should Be Equal     ${result[0]}      ${category_list}

Create and check from bd
     [Tags]             DB add
     [Documentation]    Проверка добавления нового поля через DB
     ${params}          create dictionary     category=99     categoryname=test
     cat.insert test variables      ${params}
     ${category_list}   Catdb.get price products via params     alias=alias      params=select=category,categoryname&category=eq.99
     ${result}          Cat.get categories by category     category=${99}
     ${req}=            Req.Delete On Session     alias     /categories?      params=select=category,categoryname&category=eq.99
     Col.Lists Should Be Equal     ${result[0]}      ${category_list}

*** Keywords ***
Test Setup
    connect to local host
    connect to db

Test Teardown
    disconnect from post
    disconnect to local db


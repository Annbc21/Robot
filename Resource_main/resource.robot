*** Settings ***
Library          RequestsLibrary                        WITH NAME   Req
Library          PostgreSQLDB                           WITH NAME   DB
Library          Collections                            WITH NAME   Col
Library          Lib.categories.Categories              WITH NAME   Cat
Library          Lib.categories_rest.Categories_rest    WITH NAME   Catdb
Library          JsonValidator

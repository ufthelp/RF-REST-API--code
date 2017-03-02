*** Settings ***
Test Teardown
Library           Collections
Library           RequestsLibrary

*** Variables ***

*** Test Cases ***
TC001_GET
    [Documentation]    Get the response from API
    Create Session    test    http://jsonplaceholder.typicode.com
    ${response}    Get Request    test    /posts/1
    Log    ${response.status_code}
    Should Be Equal As Strings    ${response.status_code}    200
    log    ${response.text}

TC002_POST
    [Documentation]    POST to create a resource
    Create Session    test    http://jsonplaceholder.typicode.com
    ${headers}    Create Dictionary    Content-Type=application/json
    Set Test Variable    ${data}    { "userId": 1,"id": 1,"title": "test title","body": "test body " }
    ${response}    Post Request    test    /posts    ${data}    \    ${headers}
    Log    ${response.status_code}
    Should Be Equal As Strings    ${response.status_code}    201
    log    ${response.text}

*** Keywords ***

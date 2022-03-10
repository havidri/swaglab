*** Settings ***
Documentation          
Library                SeleniumLibrary
Suite Setup            Open Browser        ${webURL}        ${BROWSERS}
Suite Teardown         Close Browser
Test Template          I login with invalid username and invalid password

*** Variables ***
${BROWSERS}                chrome
${webURL}                  https://www.saucedemo.com/
${pass}                    secret_sauce

*** Keywords ***                
I login with invalid username and invalid password
    [Arguments]                    ${username}            ${passwords}
    Maximize Browser Window
    Input Text                    id:user-name           ${username}
    Input Text                    id:password            ${passwords}
    Click Button                  id:login-button
    Element Should Be Visible     //h3[@data-test="error"]
    Page Should Contain           Epic sadface: Username and password do not match any user in this service

*** Test Cases ***                    
I login with invalid username and invalid password for User A        userA            passwordA
I login with invalid username and invalid password for User B        userB            passwordB
I login with invalid username and invalid password for User C        userC            passwordC       

I login with valid username and valid password
    Maximize Browser Window
    Input Text                    id:user-name        standard_user
    Input Text                    id:password         ${pass}
    Click Button                  id:login-button
    Page Should Contain           Products



*** Settings ***
Documentation     A test suite containing tests related to invalid Create_class.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To createClass
Suite Teardown    Close Browser
Test Setup        Go To Create class
Test Template     Create_class With Invalid Credentials Should Fail
Resource          resource.robot

*** Test Cases ***                         TITLE            DESCRIPTION              DIFFICULTY               LANGUAGE
Empty title                                ${EMPTY}         ${VALID DESCRIPTION}     ${VALID DIFFICULTY}      ${VALID LANGUAGE}
Empty description                          ${VALID TITLE}   ${EMPTY}                 ${VALID DIFFICULTY}      ${VALID LANGUAGE}
Empty difficulty                           ${VALID TITLE}   ${VALID DESCRIPTION}     0                        ${VALID LANGUAGE}
Empty language                             ${VALID TITLE}   ${VALID DESCRIPTION}     ${VALID DIFFICULTY}      0 
Empty title And description                ${EMPTY}         ${EMPTY}                 ${VALID DIFFICULTY}      ${VALID LANGUAGE}
Empty title And difficulty                 ${EMPTY}         ${VALID DESCRIPTION}     0                        ${VALID LANGUAGE}
Empty title, description and difficulty    ${EMPTY}         ${EMPTY}                 0                        ${VALID LANGUAGE}
Empty all input                            ${EMPTY}         ${EMPTY}                 0                        0

*** Keywords ***
Create_class With Invalid Credentials Should Fail
    [Arguments]    ${title}    ${description}    ${difficulty}    ${language}
    Input Title          ${title}
    Input Description    ${description}
    Select Difficulty    ${difficulty}
	Select Language      ${language}
	Submit Credentials
    Create_class Should Have Failed

Create_class Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page

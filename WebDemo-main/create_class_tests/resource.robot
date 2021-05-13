*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${DELAY}          0
${VALID TITLE}    New Yoga Class
${VALID DESCRIPTION}    This is an intermediate Level yoga class and teaches in English.
${VALID DIFFICULTY}    2
${VALID LANGUAGE}    2
${Create URL}     http://${SERVER}/createClass.html
${Created URL}    http://${SERVER}/classCreated.html
${ERROR URL}      http://${SERVER}/classCreationError.html

*** Keywords ***
Open Browser To createClass
    Open Browser    ${Create URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    createClass Should Be Open

createClass Should Be Open
    Title Should Be    Create class

Go To Create class
    Go To    ${Create URL}
    Create class Should Be Open

Input Title
    [Arguments]    ${title}
    Input Text    title_field    ${title}

Input Description
    [Arguments]    ${description}
    Input Text    description_field    ${description}

Select Difficulty
    [Arguments]    ${difficulty}
    Select from List By Index    id:difficulty_field    ${difficulty}
    
Select Language
    [Arguments]    ${language}
    Select from List By Index    id:language_field    ${language}

Submit Credentials
    Click Button    submit_button

Result Page Should Be Open
    Location Should Be    ${Created URL}
    Title Should Be    Result Page

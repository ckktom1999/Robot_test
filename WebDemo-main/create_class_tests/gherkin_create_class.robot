*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               This test is functionally identical to the example in
...               valid_create_class.robot file.
Test Teardown     Close Browser
Resource          resource.robot

*** Test Cases ***
Valid createClass
    Given browser is opened to createClass
    When user input title "New Yoga Class", description "intermediate Level and English.", difficulty "2" and language "2"
    Then Result Page should be open

*** Keywords ***
Browser is opened to createClass
    Open Browser To createClass

User input title "${title}", description "${description}", difficulty "${difficulty}" and language "${language}"
    Input Title          ${title}
    Input Description    ${description}
	Select Difficulty    ${difficulty}
	Select Language      ${language}
    Submit credentials

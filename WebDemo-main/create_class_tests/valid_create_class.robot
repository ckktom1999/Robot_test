*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To createClass
    Input Title    ${VALID TITLE}
    Input Description    ${VALID DESCRIPTION}
	Select Difficulty    2
	Select Language    2
    Submit Credentials
    Result Page Should Be Open
    [Teardown]    Close Browser

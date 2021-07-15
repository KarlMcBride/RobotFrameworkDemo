# Documentation: https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

*** Settings ***
Library             SeleniumLibrary
Suite Setup         Setup Browser
Suite Teardown      Close All Browsers


*** Variables ***
${TEST_URL}         https://duckduckgo.com/
${BROWSER}          Firefox


*** Keywords ***
Setup Browser
    Open Browser        ${TEST_URL}  ${BROWSER}
    Set Window Size     640  480
    Title Should Be     DuckDuckGo — Privacy, simplified.


*** Test Cases ***
Search For Duckduckgo
    Input Text          search_form_input_homepage  duckduckgo
    Sleep               2  Allow inital window to be observed.
    Press Keys          None  RETURN
    Sleep               2  Allow search to be observed.

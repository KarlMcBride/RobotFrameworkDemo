*** Settings ***
Documentation       Simple example using SeleniumLibrary.
Library             SeleniumLibrary

*** Variables ***
${DUCKDUCKGO URL}   https://duckduckgo.com/
${BROWSER}          Firefox


*** Keywords ***
# None


*** Test Cases ***
Open Duck Duck Go
    Open Browser    ${DUCKDUCKGO URL}    ${BROWSER}
    Capture Page Screenshot
    [Teardown]    Close Browser


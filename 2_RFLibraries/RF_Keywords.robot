*** Settings ***
Library  python_keywords.py


# Note - keyword files should not contain tests!
#      - if a keyword is used in a single test file, it's okay to have it in the test file
#      - if a keyword is used in more than one file, put it into a keywords robot file


*** Keywords ***
Hello World Extension Keyword
    [Documentation]  Logs 'Hello World' plus parameter being passed in,
    ...  then returns the full message.
    [Arguments]  ${name}
    ${full_message} =  Catenate  ${name}  says 'Hello World!'
    Log  Full message: [${full_message}]  console=true
    [Return]  ${full_message}


Basic Python Multiplier Keyword
    ${result} =  Multiply Numbers  4  3
    Log  Result: ${result}  console=true
    Should Be Equal As Numbers  12  ${result}
*** Settings ***
Library  python_keywords.py


# Note - keyword files should not contain tests!


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


Dodgy Python Keyword
    [Documentation]  Calls 'dodgy_number_echoer', and will deliberately fail
    ...  when passed 2.
    [Arguments]  ${input}
    ${result} =  Dodgy Number Echoer  ${input}
    Should Be Equal  ${input}  ${result}  Got ${result} when expecting ${input}  values=false
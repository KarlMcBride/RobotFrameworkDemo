*** Settings ***
Library  python_keywords.py


*** Keywords ***
Dodgy Python Keyword
    [Documentation]  Calls 'dodgy_number_echoer', and will deliberately fail
    ...  when passed 2.
    [Arguments]  ${input}
    ${input} =  Convert To Integer  ${input}
    ${result} =  Dodgy Number Echoer  ${input}
    Should Be Equal  ${input}  ${result}  Got ${result} when expecting ${input}  values=false


*** Test Cases ***
Dodgy Python Test For Loop
    [Documentation]  Long-hand way of running a dodgy Python method
    ...  with multiple parameters. Execution stops as soon as a failure
    ...  is encountered.
    : FOR  ${INDEX}  IN RANGE    1    5
    \    Log    INDEX: ${INDEX}
    \    Dodgy Python Keyword  ${INDEX}


Dodgy Python Test Using Template
    [Documentation]  Runs a list of inputs against a templated keyword.
    ...  It's equivalent to running the above test, except it continues
    ...  through all cases even if a failure occurs.
    [Template]  Dodgy Python Keyword
       1
       2
       3
       4
       5
*** Settings ***
# Import libraries here if needs be
#Library  Collections
#Library  OperatingSystem

*** Test Cases ***
Two Second Sleep
    [Documentation]  Basic test demonstrating sleeps
    Sleep  2


Basic Passing Arithmetic Test
    [Documentation]  Basic test demonstrating evaluation and "Should Be Equal As" checkers
    ${result}=  Evaluate  1+2
    Log  Result: [${result}]  console=true
    Should Be Equal As Numbers  3  ${result}


Basic Failing Arithmetic Test
    [Documentation]  Basic test demonstrating how a fail looks
    ${result}=  Evaluate  2+2
    Log  Result: [${result}]  console=true
    Should Be Equal As Numbers  3  ${result}


Basic Keyword Test
    [Documentation]  Example showing how keywords are used
    ${hello_world_return}=  Hello World Keyword  Dave
    Log  Return: [${hello_world_return}]  console=true


*** Keywords ***
Hello World Keyword
    [Documentation]  Logs 'Hello World' plus parameter being passed in,
    ...  then returns the full message.
    [Arguments]  ${name}
    ${full_message} =  Set Variable  ${name} says 'Hello World!'
    Log  Full message: [${full_message}]  console=true
    [Return]  ${full_message}

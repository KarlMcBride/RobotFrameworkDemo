*** Settings ***
# Import libraries here if needs be
Resource  RF_Keywords.robot

*** Test Cases ***
Basic Resource Keyword Test
    [Documentation]  Extension of Hello World in 1_BasicRF,
    ...  using keyword in another .robot file.
    ${hello_world_return}=  Hello World Extension Keyword  Bob Marley
    Log  Return: [${hello_world_return}]  console=true


Basic Python Test
    [Documentation]  Extension of Hello World in 1_BasicRF,
    ...  using keyword in another .robot file.
    Basic Python Multiplier Keyword
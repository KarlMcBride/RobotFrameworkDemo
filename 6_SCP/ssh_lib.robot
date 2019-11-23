*** Settings ***
Library     SSHLibrary  WITH NAME  SSH

*** Variables ***
${USERNAME}               pi
${PASSWORD}               42
${HOST}                   192.168.1.134
${PROMPT}                 $

*** Keywords ***
Login As Valid User
    Open Connection  ${HOST}  prompt=${PROMPT}
    Login  ${USERNAME}  ${PASSWORD}

Check File Permissions
   [Arguments]  ${expected_permission}   ${remote_file}=to_put${/}ExampleText3.txt
   ${actual_permission}=  Execute Command  stat -c %a ${remote_file}
   Should Not Be Empty    ${actual_permission}    Failed to determine permissions for file:\t${remote_file}
   Should Be Equal As Integers  ${actual_permission}  ${expected_permission}  File '${remote_file}' does not have expected permissions '${expected_permission}' set:\t${actual_permission}
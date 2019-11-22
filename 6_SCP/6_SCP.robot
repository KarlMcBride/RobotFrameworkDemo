# Source: https://github.com/robotframework/SSHLibrary/blob/master/atest/put_file.robot

*** Settings ***
Force Tags      pybot   jybot
Resource        sftp.robot
Suite Setup     Login As Valid User
Suite Teardown  Close All Connections
Library         OperatingSystem  WITH NAME  OS
Library         String

*** Test Cases ***
Put File To Home Directory
    SSH.File Should Not Exist  ${FILE WITH NON-ASCII NAME}
    Put File  ${FILE WITH NON-ASCII}  /tmp/foo.txt
    SSH.File Should Exist  /tmp/foo.txt
    [Teardown]  Execute Command  rm -f /tmp/foo.txt

Put File Should Fail When There Are No Source Files
    Run Keyword And Expect Error  There are no source files matching 'nonexisting'.
    ...                           SSH.Put File  nonexisting

*** Keywords ***
Change User And Overwrite File
    Open Connection  ${HOST}  prompt=${PROMPT}
    Login With Public Key  ${KEY USERNAME}  ${KEY}
    Put File  ${LOCAL TEXTFILES}${/}${TEST FILE NAME}  ${REMOTE HOME TEST}
    [Teardown]  Close Connection

Add testkey User To Group test And Set Permissions
    Execute Command  usermod -a -G test testkey  sudo=True  sudo_password=test
    Execute Command  chmod -R 660 ${TEST FILE NAME}

Remove testkey User From Group test And Cleanup
    Execute Command  gpasswd -d testkey test  sudo=True  sudo_password=test
    Execute Command  rm -rf ${TEST FILE NAME}

Remove Local Temp Dir And Remote File
    [Arguments]  ${path}
    Remove Directory  ${LOCAL TMPDIR}  yes
    Execute Command  rm -f ${path}
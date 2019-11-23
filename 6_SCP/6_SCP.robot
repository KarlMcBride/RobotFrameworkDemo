# Source: https://github.com/robotframework/SSHLibrary/blob/master/atest/put_file.robot

*** Settings ***
Library         DateTime
Library         OperatingSystem
Library         String

Resource        ssh_lib.robot

Suite Setup     Login As Valid User
Suite Teardown  Close All Connections

*** Variables ***
${SCP_FILE_NAME}    time_stamp.txt
${SCP_FILE_LOC}     ${EXECDIR}/logs/${SCP_FILE_NAME}

*** Test Cases ***
Put File To Home Directory
    [Documentation]  Copies a timestamped file to remote
    ...  cat's and logs its contents, then deletes the file.
    ${current_date} =  Get Current Date
    Create File  ${SCP_FILE_LOC}  ${current_date}
    SSH.File Should Not Exist  ${SCP_FILE_NAME}
    Put File  ${SCP_FILE_LOC}  .
    SSH.File Should Exist  ./${SCP_FILE_NAME}
    ${file_contents}=         Execute Command    cat ./${SCP_FILE_NAME}
    Log  File [${SCP_FILE_NAME}] contains [${file_contents}]  console=true
    [Teardown]  Execute Command  rm -f ./${SCP_FILE_NAME}

Put File Should Fail When There Are No Source Files
    Run Keyword And Expect Error  There are no source files matching 'nonexisting'.
    ...                           SSH.Put File  nonexisting
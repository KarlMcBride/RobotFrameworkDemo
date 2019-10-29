*** Settings ***
# Suite setup will be run at the start of a suite.
# It can be used for getting a target into a testable state
# e.g. opening a Selenium window, navigating to a home page
Suite Setup  Log  Suite Setup  WARN

# Suite teardown will be run at the end of a suite.
# It can be used to return the target into a default state,
# to ensure that the behaviour of one suite doesn't affect another
# e.g. resetting picture settings, stopping running streaming sessions.
Suite Teardown  Log  Suite Teardown  WARN

# Test setup will be run at the start of every test.
# For example, it can be used to start tailing logs.
# It can be overridden by test-specific [Setup] keywords
Test Setup  Log  Test Setup  WARN


# Test teardown will be run at the end of every test.
# For example, it can be used to stop tailing logs.
# It can be overridden by test-specific [Teardown] keywords
Test Teardown  Log  Test Teardown.  WARN

# Test timeout will cause any tests in this suite to fail if they
# take longer than this.
# It can be overridden by test-specific [Timeout] keywords
Test Timeout  5 Seconds


*** Keywords ***
Keyword With Local Setup And Teardown
    [Setup]  Log  Keyword Setup  WARN
    Sleep  2
    [Teardown]  Log  Keyword Teardown  WARN


*** Test Cases ***
Failing Test
    [Documentation]  Example failing test to demonstrate
    ...  test teardown running afterwards.
    Fail  Deliberately Failing Test


Test With Local Setup And Teardown
    [Documentation]  Example showing overriding of
    ...  suite-level setup and teardown
    [Setup]  Log  Local Setup  WARN
    Sleep  2
    [Teardown]  Log  Local Test Teardown  WARN


Test Calling Keyword With Locals
    Keyword With Local Setup And Teardown


Test That Will Fail Due To Setup Timeout
    Sleep  10


Test That Will Fail Due To Local Timeout
    [Documentation]  Demonstrating local test timeout, that overrides
    ...  the suite-level "Test Timeout"
    [Timeout]  2 Seconds
    Sleep  10
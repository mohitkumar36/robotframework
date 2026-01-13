*** Settings ***
Library    Browser

*** Test Cases ***
Open Browser And Verify Title
    New Browser    chromium    headless=False    args=["--start-maximized"]
    New Context    viewport=${None}
    New Page    https://www.google.com
    ${title}=    Get Title
    Should Be Equal    ${title}    Google
    Sleep    10s
    Close Browser
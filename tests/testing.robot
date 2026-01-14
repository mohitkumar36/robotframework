*** Settings ***
Library    Browser

*** Test Cases ***
Open Browser And Verify Title
    [Documentation]    Open a Chromium browser, navigate to Google, and verify the page title.
    [Tags]    smoke    browser
    New Browser    chromium    headless=True    args=["--start-maximized"]
    New Context    viewport=${None}
    New Page    https://www.google.com
    ${title}=    Get Title
    Should Be Equal    ${title}    Google
    Sleep    5s
    Close Browser

Open Browser And Capture Screenshot
    [Documentation]    Open a Chromium browser, navigate to Google, and capture a screenshot.
    [Tags]    regression    browser
    New Browser    chromium    headless=True    args=["--start-maximized"]
    New Context    viewport=${None}
    New Page    https://www.google.com
    Take Screenshot    google_homepage.png
    Sleep    5s
    Close Browser
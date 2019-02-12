*** Settings ***
Resource          AllFilesImport.robot
Library           ExtendedSelenium2Library


*** Variables ***
${iseek Login Url}  http://122.166.186.167:8080/Merchant_APP1/#/login
${iseek Login Url Home}  http://122.166.186.167:8080/Merchant_APP1
${Browser}        Chrome
${USERNAME - INPUT - LOCATOR}   xpath=//input[@placeholder='Mobile Number']
${PASSWORD - INPUT - LOCATOR}   xpath=//input[@placeholder='Password / PIN']
${Login Button Locator}        xpath=//span[text()=' LOGIN ']

*** Keywords ***
Open Browser To Login Page
  Set Selenium Implicit Wait      3s
  Open Browser  ${iseek Login Url}  ${Browser}
  Maximize Browser Window

Open Browser To Home Page
  Set Selenium Implicit Wait      3s
  Open Browser  ${iseek Login Url Home}  ${Browser}
  Maximize Browser Window

Custom Click Element
  [Arguments]  ${LOCATOR}
   wait until page contains element              ${LOCATOR}        ${TIMEOUT}
   click element                                 ${LOCATOR}

Login as Merchant - Sunny
    Open Browser To Login Page
    Input Text              ${USERNAME - INPUT - LOCATOR}    ${Sunny-Username}
    Input Text              ${PASSWORD - INPUT - LOCATOR}    ${Sunny-Password}
    Custom Click Element   ${Login Button Locator}
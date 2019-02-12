*** Settings ***
Resource     ../Common/AllFilesImport.robot
Library           ExtendedSelenium2Library
#Library         Selenium2Library

*** Variables ***
${BusinessName}     xpath=//input[@placeholder='Business name']


*** Keywords ***
Enter Business Name
    
*** Settings ***
Resource     ../Common/AllFilesImport.robot
Test Teardown   Close Browser


*** Test Cases ***
Validate SUBMIT button is disabled initially as soon as clicked on 'Add offer'
  [Tags]   Testcase:1
  Login as Merchant - Sunny
  wait until angular ready   ${TIMEOUT}
  Click on Create offers
  Click on Add offer
  Verify SUBMIT button is disabled or not

*** Settings ***
Resource     ../Common/AllFilesImport.robot
Test Teardown   Close Browser


*** Test Cases ***
Validate Description Should Be Minimum 6 Characters
  [Tags]   Testcase:2
  Login as Merchant - Shamanth
  wait until angular ready   ${TIMEOUT}
  Click on Create offers
  Click on Add offer
  Enter Text in Description text field which is less than 6 characters   Test
  Click on SUBMIT IN 'New offer' pop up
  Verify Error message 'Description should be minimum 6 characters.'
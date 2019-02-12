*** Settings ***
Resource     ../Common/AllFilesImport.robot
Test Teardown   Close Browser


*** Test Cases ***
Validate SUBMIT Button Is Enabled When All Fields Are Entered
  [Tags]   Testcase:3
  Login as Merchant - Shamanth
  wait until angular ready   ${TIMEOUT}
  Click on Create offers
  Click on Add offer
  Select Business Category  Spa
  Select Applies TO  iSeek Users
  Enter Text for Select/create offers  Offer56
  Enter Text in Description text field which is more than 6 characters   DescriptionTest
  Select Start date   2020   APR   9
  Select Start Time
  Click on Ok on TimePopup
  Select Expiry date    2020   MAY   9
  Select Expiry Time
  Click on Ok on TimePopup
  Select discount on  Discount on Bill
  Select Type of discount  Rupees
  Select Discount Upto in Rupees  20
  Select Usage Type  Once
  Enter In Rupees for Minimum Bill  300
  Validate SUBMIT Button Is Enabled When All Fields Are Entered
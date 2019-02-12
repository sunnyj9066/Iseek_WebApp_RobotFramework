*** Settings ***
Resource     ../Common/AllFilesImport.robot
#Test Teardown   Close Browser


*** Test Cases ***
Validate Offer Added Successfully Without Sending Notification
  [Documentation]  Validate that Offer added successfully without sending notification. Also validate the “offer confirmation’ popup
  [Tags]   Testcase:4
  Login as Merchant - Shamanth
  wait until angular ready   ${TIMEOUT}
  Click on Create offers
  Click on Add offer
  Select Business Category  spa
  Select Applies TO  iSeek Users
  Enter Text for Select/create offers  Offer28
  Enter Text in Description text field which is more than 6 characters   DescriptionTest
  Select Start date   2019   JUN   8
  Select Start Time
  Click on Ok on TimePopup
  Select Expiry date    2019   JUL   8
  Select Expiry Time
  Click on Ok on TimePopup
  Select discount on  Discount on Bill
  Select Type of discount  Rupees
  Select Discount Upto in Rupees  20
  Select Usage Type  Once
  Enter In Rupees for Minimum Bill  300
  Click on SUBMIT IN 'New offer' pop up
  Verify 'Offer confirmation' pop up appeared or not
  Click on YES in 'Offer confirmation' popup
  Click NO in 'Confirm' popup
  Verify Offer Added Successfully or not in 'create offers' Page




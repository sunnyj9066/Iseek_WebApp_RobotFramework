*** Settings ***
Resource     ../Common/AllFilesImport.robot
#Test Teardown   Close Browser


*** Test Cases ***
Validate deletion of Offer
  [Documentation]  Validate deletion of Offer. Create a  offer and delete
  [Tags]   Testcase:5
  Login as Merchant - Shamanth
  wait until angular ready   ${TIMEOUT}
  Click on Create offers
  Click on Add offer
  Select Business Category  Hair Care
  Select Applies TO  iSeek Users
  Enter Text for Select/create offers  OfferFubeus123
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
  Click on Vertical Ellipsis of created offers  OfferFubeus123
  Click on 'End Offer'
  Click YES in 'Confirm' popup
  Click on Close button of deleted Offer and verify Status - Inactive




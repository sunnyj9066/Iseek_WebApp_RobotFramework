*** Settings ***
Resource     ../Common/AllFilesImport.robot
Library           ExtendedSelenium2Library
Library         DateTime
Library           String
#Library         Selenium2Library


*** Variables ***
${Enter Offer}
${Flag}
${Entered Offer}
${SelectCreatedOfferUpperCase}

${Add offer - button - LOCATOR}   xpath=//span[text()=' Add Offer ']
${Submit Button Locator}        xpath=//span[text()=' SUBMIT ']/..
${Create offers Left Nav Locator}        xpath=//mat-nav-list/div[8]
${Description Text Field}     xpath=//textarea[@placeholder='Description']
${Error message for Min Characters-Locator}   xpath=//mat-error[text()=' Description should be minimum 6 characters. ']
${SelectBusinessCategory-Dropdown-Locator}     xpath=//mat-select[@aria-label='Select business category']
${Select-AppliesTO-Dropdown-Locator}           xpath=//mat-select[@placeholder='Applies To']//div[@class='mat-select-arrow']
${Select/create offers -Text Field- Locator}   xpath=//input[@placeholder='Select / create offer']

${StartTime-Input-Locator}      xpath=//input[@formcontrolname='start_time']
${StartTimeSelectAM-Locator}         xpath=//div[text()='AM']
${StartTime-hour-Locator}       xpath=//div[@class='time-picker-hour selected']
${StartTime-Select12HH-Locator}         xpath=//button[text()=' 12 ']
${StartTime-Minute-Locator}     xpath=//div[@class='time-picker-minute']
${StartTime-SelectOOMM-Locator}         xpath=//button[text()=' 0 ']
${TimePopup-OK-button-Locator}          xpath=//button[text()='Ok']
${StartDate-DatePicker-Button-Locator}          xpath=//input[@placeholder='Start date']/../..//mat-datepicker-toggle[@class='mat-datepicker-toggle']
${StartDate-DownArrow-Locator}         xpath=//div[@class='mat-calendar-arrow']
${ExpiryDate-DatePicker-Button-Locator}   xpath=//input[@placeholder='Expiry date']/../..//mat-datepicker-toggle[@class='mat-datepicker-toggle']
${ExpiryDate-DownArrow-Locator}         xpath=//div[@class='mat-calendar-arrow']
${ExpiryTime-Input-Locator}             xpath=//input[@formcontrolname='expiry_time']
${ExpiryTimeSelectPM-Locator}         xpath=//div[text()='PM']
${ExpiryTime-hour-Locator}              xpath=//div[@class='time-picker-hour selected']
${ExpiryTime-Select11HH-Locator}         xpath=//button[text()=' 11 ']
${ExpiryTime-Minute-Locator}            xpath=//div[@class='time-picker-minute']
${ExpiryTime-Select59MM-Locator}         xpath=//div[@style='transform: rotate(354deg); background: rgb(30, 33, 41);']
${SelectDiscountOn-Dropdown-Locator}     xpath=//span[text()='Select discount on']
${TypeOfDiscount-Dropdown-Locator}      xpath=//span[text()='Type of discount']
${DiscountUptoInRupees-Textfield-Locator}             xpath=//input[@placeholder='Discount Rs']
${UsageType-DropDown-Locator}          xpath=//mat-select[@placeholder='Usage type']//div[@class='mat-select-arrow']
${MinimumBill-Textfield-Locator}           xpath=//input[@placeholder='Minimum Bill']
${OfferConfirmation-Header-Locator}        xpath=//span[text()='Offer confirmation']
${OfferConfirmationPopupYES-Button-Locator}     xpath=//span[text()='YES']
${ConfirmPopupNO-Button-Locator}        xpath=//h1[text()='Confirm']/..//span[text()='NO']
${ConfirmPopupYES-Button-Locator}        xpath=//h1[text()='Confirm']/..//span[text()='YES']
${OfferName-FirstColumn-Locator}    xpath=//th[text()=' NAME ']/../../..//td[1]
${EndOffer-VerticalEllipsisOption-Locator}    xpath=//span[text()='End offer']
${Status-Inactive-TextLocator}      xpath=//h4[@class='ng-star-inserted'][2]

*** Keywords ***
Click on Add offer
  Custom Click Element   ${Add offer - button - LOCATOR}

Click on Create offers
  Custom Click Element   ${Create offers Left Nav Locator}

Verify SUBMIT button is disabled or not
  ${result}=  Run Keyword And Return Status  Element Should Be Disabled   ${Submit Button Locator}
  Run Keyword If  ${result}==True   Log To Console  SUBMIT button is Disabled
  ...  ELSE    Fail	 SUBMIT button is enabled

Enter Text in Description text field which is less than 6 characters
  [Arguments]  ${Characters}
  Input Text   ${Description Text Field}  ${Characters}

Click on SUBMIT IN 'New offer' pop up
   custom click element  ${Submit Button Locator}

Verify Error message 'Description should be minimum 6 characters.'
  ${Error MSG for min Characters}=   Get Text   ${Error message for Min Characters-Locator}
  Run Keyword If  '${Error MSG for min Characters}'=='Description should be minimum 6 characters.'  Log To Console   Error message is displayed like 'Description should be minimum 6 characters.'
  ...  ELSE    Fail	 Error message is not displayed properly

Select Business Category
   [Arguments]  ${SBC-DropdownValues}
   custom click element   ${SelectBusinessCategory-Dropdown-Locator}
   custom click element   xpath=//span[@class='mat-option-text'][text()="${SBC-DropdownValues}"]

Select Applies TO
  [Arguments]  ${AppliesTO-DropdownValues}
  Custom Click Element  ${Select-AppliesTO-Dropdown-Locator}
  custom click element  xpath=//span[@class='mat-option-text'][text()='${AppliesTO-DropdownValues}']

Enter Text for Select/create offers
    [Arguments]  ${Enter Offer}
    Input Text   ${Select/create offers -Text Field- Locator}  ${Enter Offer}
    Set Global Variable     ${Enter Offer}

Enter Text in Description text field which is more than 6 characters
   [Arguments]  ${Characters}
   Input Text   ${Description Text Field}  ${Characters}

Select Start Time
   Custom Click Element    ${StartTime-Input-Locator}
   Custom Click Element    ${StartTimeSelectAM-Locator}
   Custom Click Element    ${StartTime-hour-Locator}
   Custom Click Element    ${StartTime-Select12HH-Locator}
   Custom Click Element    ${StartTime-Minute-Locator}
   Custom Click Element    ${StartTime-SelectOOMM-Locator}

Click on Ok on TimePopup
   Custom Click Element     ${TimePopup-OK-button-Locator}

Select Start date
    [Arguments]   ${Year}  ${Month}  ${Day}
#    ${CurrentDate}=  Get Current Date  result_format=%Y/%m/%d %H:%M:%S.%f
#    ${newdatetime} =  Add Time To Date  ${CurrentDate}  2 days
#    Log  ${newdatetime}
    Custom Click Element    ${StartDate-DatePicker-Button-Locator}
    Custom Click Element    ${StartDate-DownArrow-Locator}
    Custom Click Element    xpath=//div[@class='cdk-overlay-pane mat-datepicker-popup']//div[text()='${Year}']
    Custom Click Element    xpath=//div[@class='mat-calendar-body-cell-content']/../../td/div[text()='${Month}']
    Custom Click Element    xpath=//div[@class='mat-calendar-body-cell-content']/../../td/div[text()='${Day}']
Select Expiry date
    [Arguments]   ${Year}  ${Month}  ${Day}

    Custom Click Element    ${ExpiryDate-DatePicker-Button-Locator}
    Custom Click Element    ${ExpiryDate-DownArrow-Locator}
    Custom Click Element    xpath=//div[@class='cdk-overlay-pane mat-datepicker-popup']//div[text()='${Year}']
    Custom Click Element    xpath=//div[@class='mat-calendar-body-cell-content']/../../td/div[text()='${Month}']
    Custom Click Element    xpath=//div[@class='mat-calendar-body-cell-content']/../../td/div[text()='${Day}']

Select Expiry Time
   Custom Click Element    ${ExpiryTime-Input-Locator}
   Custom Click Element    ${ExpiryTimeSelectPM-Locator}
   Custom Click Element    ${ExpiryTime-hour-Locator}
   Custom Click Element    ${ExpiryTime-Select11HH-Locator}
   Custom Click Element    ${ExpiryTime-Minute-Locator}
   Custom Click Element    ${ExpiryTime-Select59MM-Locator}

Select discount on
   [Arguments]   ${Discount on}

   Custom Click Element    ${SelectDiscountOn-Dropdown-Locator}
   Custom Click Element    xpath=//span[text()='${Discount on}']

Select Type of discount
    [Arguments]   ${Type of discount}

    Custom Click Element    ${TypeOfDiscount-Dropdown-Locator}
    Custom Click Element    xpath=//span[text()='${Type of discount}']

Select Discount Upto in Rupees
    [Arguments]   ${DiscountUptoinRupees}
    Input Text    ${DiscountUptoInRupees-Textfield-Locator}   ${DiscountUptoinRupees}

Select Usage Type
    [Arguments]   ${Usage Type}

    Custom Click Element    ${UsageType-DropDown-Locator}
    Custom Click Element    xpath=//span[text()='${Usage Type}']

Enter In Rupees for Minimum Bill
    [Arguments]   ${MinimumBillInRupees}

    Input Text    ${MinimumBill-Textfield-Locator}  ${MinimumBillInRupees}

Validate SUBMIT Button Is Enabled When All Fields Are Entered
    Wait Until Element Is Enabled   ${Submit Button Locator}  ${TIMEOUT}
    ${result}=  Run Keyword And Return Status  Element Should Be Enabled   ${Submit Button Locator}
    Run Keyword If  ${result}==True   Log To Console  SUBMIT button is Enabled
    ...  ELSE    Fail	 SUBMIT button is Disabled

Verify 'Offer confirmation' pop up appeared or not
    Wait Until Element Is Visible   ${OfferConfirmation-Header-Locator}  ${TIMEOUT}
    Element Should Be Visible       ${OfferConfirmation-Header-Locator}

Click on YES in 'Offer confirmation' popup
    Custom Click Element    ${OfferConfirmationPopupYES-Button-Locator}

Click NO in 'Confirm' popup
    Custom Click Element    ${ConfirmPopupNO-Button-Locator}


Set Variable For Flag
    ${Flag}=    Set Variable  1
    Set Global Variable  ${Flag}

Verify Offer Added Successfully or not in 'create offers' Page
    ${Entered Offer}=  Convert To Uppercase  ${Enter Offer}
    Log  ${Entered Offer}

    ${Flag}=  Set Variable  0
    Set Global Variable  ${Flag}
    @{ListOfOfferNames-FirstColumn}=  Get Webelements  ${OfferName-FirstColumn-Locator}

    : FOR    ${Item}    IN    @{ListOfOfferNames-FirstColumn}
    \  ${OfferName}=  Get Text  ${Item}
    \  ${OfferNameStipped}=  Strip String  ${OfferName}
    \  Run Keyword If  '${Entered Offer}'=='${OfferNameStipped}'  Run Keywords  Set Variable For Flag  AND  Exit For Loop


    Run Keyword If   ${Flag} == 1   Log To Console  Entered Offer ${Entered Offer} is Present in 'create offers' Page
    ...  ELSE  Fail  Entered Offer ${Entered Offer} is not Present in 'create offers' Page

Click on Vertical Ellipsis of created offers
    [Arguments]   ${SelectCreatedOffer}
    ${SelectCreatedOfferUpperCase}=  Convert To Uppercase  ${SelectCreatedOffer}
    Set Global Variable  ${SelectCreatedOfferUpperCase}
    Custom Click Element   xpath=//th[text()=' NAME ']/../../..//td[1][text()=' ${SelectCreatedOfferUpperCase} ']/..//mat-icon[text()='more_vert']

Click on 'End Offer'
    custom click element   ${EndOffer-VerticalEllipsisOption-Locator}

Click YES in 'Confirm' popup
    custom click element   ${ConfirmPopupYES-Button-Locator}

Click on Close button of deleted Offer and verify Status - Inactive

    custom click element  xpath=//th[text()=' NAME ']/../../..//td[1][text()=' ${SelectCreatedOfferUpperCase} ']/..//mat-icon[text()='close']
    ${Status-Inactive-Text}=    Get Text    ${Status-Inactive-TextLocator}
    Log     ${Status-Inactive-Text}
    Element Text Should Be  ${Status-Inactive-TextLocator}  Status - Inactive  message= Status is not Inactive


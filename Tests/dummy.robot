*** Settings ***
Library           ExtendedSelenium2Library
Library           String
Library         ExcelLibrary
Library           Collections

*** Variables ***
${Str}=    ${SPACE}${SPACE}${SPACE}foo${SPACE}${SPACE}${SPACE}
${Str2}=  False
${Entered Offer}  Offer1
${Flag}
${path_excel}     C:\\Users\\User\\PycharmProjects\\iSeek\\Tests\\ExcelFile1.xls


*** Test Cases ***
String Test
#    Test string Key
#    Equals test
    OExcel
*** Keywords ***
Test string Key

    ${WithSpace}=   Set Variable   ${Str}
    ${WithoutSpace}=  Set Variable  ${Str.strip()}
    Log  ${WithSpace}
    Log  ${WithoutSpace}

Set Variable For Flag
    ${Flag}=    Set Variable  1
    Set Global Variable  ${Flag}

Equals test
    @{names} =	Create List 	Offer2	 Offer3  Offer1	 Offer4
    ${OfferNameStipped}  Set Variable  Offer1
    ${Flag}=  Set Variable  0
    Set Global Variable  ${Flag}
    : FOR    ${Item}    IN    @{names}
    \  Run Keyword If  '${Entered Offer}'=='${Item}'  Run Keywords  Set Variable For Flag  AND  Exit For Loop


    Run Keyword If   ${Flag}== 1  Log To Console  Entered Offer ${Entered Offer} is Present in 'create offers' Page
    ...  ELSE  Fail  Entered Offer ${Entered Offer} is not Present in 'create offers' Page

OExcel
    Open Excel   ${path_excel}
#    ${ColumnValues}=  Create List
#    ${ColumnValues}=  Get Column Values   Sheet1  0
#    Log  ${ColumnValues}
    ${ColumnValues}=   Read Cell Data By Coordinates  Sheet1  0  1
    Log  ${ColumnValues}


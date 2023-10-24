*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    SikuliLibrary   mode=NEW
Suite Setup    Start Sikuli Process
Suite Teardown    Stop Remote Server


*** Keywords ***
Read All images
    Add Image Path  ${IMG_PATH}
#C:\Users\0006225144085\OneDrive - PSG\Documents\Daily Tial Morning Checks\pics
Open my browser
    [Arguments]    ${URL}    ${Browser}
    Open Browser    about:blank    browser=${Browser}     #options=add_argument("--headless")
    Go To           ${URL}
    Title Should Be    SystemA Tial Connect
    Sleep    2s 

input enabled text
    [Arguments]    ${element}      ${inputText}
    ${count}=    Set Variable    0
    ${status}=    Set Variable    False
    WHILE    '${status}' == 'False'
        ${count}=    Evaluate    ${count} + 1
        ${isVisible}=    Run Keyword And Return Status     Wait Until Element Is Visible    ${element}
        ${isEnabled}=    Run Keyword And Return Status     Wait Until Element Is Enabled   ${element}
        IF    ${isEnabled} and ${isVisible}
            ${status}=    Evaluate    True
            Clear Element Text    ${element}
            Input Text        ${element}     ${inputText}
            BREAK
        ELSE IF     ${count} >= 45
            BREAK
        END
    END
    

LOAD A SCREEN ${PopUpLoading}
    ${status}=   Run Keyword And Return Status     Wait Until Element Is Not Visible    ${PopUpLoading}
    [return]  ${status}


click enabled button 
    [Arguments]    ${element}
    ${count}=    Set Variable    0
    ${status}=    Set Variable    False
    WHILE    '${status}' == 'False'
        ${count}=    Evaluate    ${count} + 1
        ${isVisible}=    Run Keyword And Return Status     Wait Until Element Is Visible    ${element}
        ${isEnabled}=    Run Keyword And Return Status     Wait Until Element Is Enabled    ${element}
        IF    ${isEnabled} and ${isVisible}
            ${status}=    Evaluate    True
            Click Element    ${element}
            BREAK
        ELSE IF     ${count} >= 45
            BREAK
        END
    END

Inventory population  
    Input Text      ${txt_IAddress}    123 ABCDEF street, Insure Block, Centurion, 1400
    Input Text      ${txt_InsuredName}    Micheal Insurance

Press next
    click enabled button    ${btn_Inext}
    Sleep   2s

Bathroom population test
    Input Text  xpath://input[@gt-desc='Curtains, loose carpets and towels']   1000
    Input Text  xpath://input[@gt-desc='Shaving equipment']    500
    Input Text  xpath://input[@gt-desc='Toiletries']    1500
    Sleep   2s

Generating the report
    click enabled button   xpath://input[@value='Generate Report'] 

Pressing the "click to download"
    click enabled button  xpath://a[text()='Click to download']
    Sleep   3s
    
Go to google
    go to   https://google.com
    Sleep   2s

Verify Inventory download  
   ${status}      ${error}      Run Keyword And Ignore Error    Wait Until Page Contains Element    xpath://span[contains(text(),'Report')]        15s
   Run Keyword If      '${status}' == 'PASS'     Go to google
   Log    Inventory Calculator Sucessful
   Sleep    5s

Go Back
    Execute Javascript  history.back()

Press BI Calculator
    click enabled button  ${btn_BiCalculator}  
    Sleep   2s

    click enabled button    ${btn_NewCalculator}     
    Sleep   2s

Press sign in
    click enabled button    ${btn_sign_into}    
    Sleep    2s
    
Input Data
    input enabled text      ${txt_PSGBranch}    PSG Insure
    input enabled text      ${txt_Adviser}      Xolani nqubezelo

    input enabled text  ${txt_Email}   ABC@gmail.com
    input enabled text  ${txt_Contact}    081 888 9999
    input enabled text  ${txt_Address}   123 ABCDEF street, Insure Block, Centurion, 1400
    input enabled text  ${txt_NameOfInsured}     Mike McDonalds

    Select From List By Label   ${txt_Industry}      Property owner

    input enabled text  ${txt_Description}    Screening potential tenants, Drafting, signing, and renewing leases on behalf of property owners,Collecting rent,Maintenance of properties, including landscaping and snow removal,Arranging for necessary repairs to properties,Setting up and adhering to budgets for property maintenance, Understanding state and national landlord-tenant laws and regulations.
    #item 2
    input enabled text  ${txt_GrossRentals}    3000000.00
    input enabled text  ${txt_ExpectedIncrease}    15
    input enabled text  ${txt_GrowthRate}    20
    #items 4
    input enabled text  ${txt_AddIncreaseCost}    200000

Go to Inventory
    go to   https://psgcloud.sharepoint.com/sites/STA_External/Lists/Inventory%20Calculator/newform.aspx
    Sleep   2s

Validation of BI
   Sleep    5s
   ${status}      ${error}      Run Keyword And Ignore Error    Wait Until Page Contains Element     xpath://h3[contains(text(),'DOCUMENT GENERATED')]      10s
   Run Keyword If      '${status}' == 'PASS'     Go to Inventory

Saving Info
    click enabled button    ${btn_save}   
    Sleep   2s
    click enabled button    ${btn_WaitforSubmission} 
    Sleep   2s
    click enabled button    ${btn_GenerateDoc} 
    Sleep   3s
    Log    BI Calculator test successful

choose role
    click enabled button     ${btn_choose_account}       

Enter UserName
    [Arguments]    ${username}     
    input enabled text    ${txt_loginUserName}     ${username}
    Sleep   2s

ClickNext
    click enabled button  ${btn_next}   
    Sleep   2s

Enter Password    
    [Arguments]    ${password}     
    input enabled text    ${txt_loginPassword}    ${password}
    Sleep   2s

Click signin    
    click enabled button    ${btn_signIn} 
    Sleep   2s

Verification
    click enabled button    ${btn_callUser}   
    Sleep   30s

Verify Successful Login
    ${status}      ${error}      Run Keyword And Ignore Error    Wait Until Page Contains Element  xpath://span[contains(text(),'PSG Branch')]        10s
    Run Keyword If      '${status}' == 'PASS'     Log    Login was a success!
    Sleep   2s

Close My Browser
    Close all browsers

***Test Cases***
LoginTest
    Open my browser    ${URL}    ${Browser}
    Sleep    2s
    Click Element     ${OATH_button}
    Sleep   5s
    

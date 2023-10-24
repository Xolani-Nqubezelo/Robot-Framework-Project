*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    SikuliLibrary   mode=NEW
Suite Setup    Start Sikuli Process
Suite Teardown    Stop Remote Server


*** Variables ***
${sikuli_path}    C://Users//0006225144085//Downloads//sikulixide-2.0.5
${IMG_PATH}    "C://Users//0006225144085//OneDrive - PSG\Documents//Daily Tial Morning Checks//pics//OAuth.png"
${Browser}   Chrome
${Oauth}    OAuth.png
${first}    xpath://input[@id='otherTileText']
${OATH_button}      xpath://div[@name='cmdOAuthLogin']
${URL}     https://stabauuat.psg.co.za/systema
${username}     stalogicapp@psg.co.za
${URL_Inventory}      https://psgcloud.sharepoint.com/sites/STA_External/Lists/Inventory%20Calculator/newform.aspx
${URL_Jira}       https://jira.psg.co.za/login.jsp
${password}      P$g98@loGi
${btn_next}     xpath://input[@id='idSIButton9']
${user_data_path}      C:\Users\0006225144085\ChromeProfile\Default
${txt_loginUserName}       name=loginfmt
${txt_loginPassword}      name=passwd
${btn_choose_account}    xpath://img[@role='presentation']
${btn_signIn}     xpath://input[@id='idSIButton9']
${btn_next}     xpath://input[@id='idSIButton9']
${btn_callUser}    xpath://div[@class='flex-column']
${txt_branch}    xpath://input[@id='PSG_x0020_Branch_9c834227-7d75-4996-ad1a-cf72b93d7f47_$TextField']
${txt_IContact}      xpath://input[@id='Contact_x0020_Number_8e55c014-b1c8-4c1f-bb86-14428f2cdbcd_$TextField']
${txt_IAddress}    xpath://textarea[@id='Physical_x0020_Address_7327eb2d-2445-4348-8468-b09e0e7a3fa9_$TextField']
${txt_InsuredName}   xpath://input[@id='What_x0020_is_x0020_the_x0020_na_5e0ce6e9-52c3-4e0c-8506-1a8809dae908_$TextField']
${btn_Inext}   xpath://input[@id='next-button']
${txt_Curtains}    xpath://input[@gt-desc='Curtains, loose carpets and towels']
${txt_Shaving}   xpath://input[@gt-desc='Shaving equipment']
${txt_toiletries}    xpath://input[@gt-destc='Toiletries']
${btn_GenerateReport}    xpath://input[@value='Generate Report']
${btn_ClickDownload}     xpath://a[text()='Click to download']
#BI calculator
${btn_sign_into}        xpath://input[@id='idSIButton9']
${VerifyDownload}    xpath://h3[text()='DOCUMENT GENERATED']
${btn_BiCalculator}     xpath://div[@title='BI Calculator']
${btn_NewCalculator}    xpath://span[text()='New Calculator']
${txt_PSGBranch}    xpath://input[@id='PSG_x0020_Branch_a13552e0-a882-40ca-8126-b9c4e53335cb_$TextField']
${txt_Adviser}    xpath://input[@id='Advisor_6c51364d-e359-45bb-9ef0-9e950d06ed7d_$TextField']
${txt_Email}    id=e_x002d_mail_x0020_address_9d8a2a95-f23d-416c-ae27-8a660bfc9cee_$TextField
${txt_Contact}   id=Contact_x0020_number_ebf5a7f1-02fb-44c3-a075-3abe7f3546e1_$TextField
${txt_Address}    id=Physical_x0020_address_bd39361a-5ff8-458e-a5f5-5af5ababfe9c_$TextField
${txt_NameOfInsured}   id=What_x0020_is_x0020_the_x0020_na_eb14fd4f-a81e-431f-8306-8557c1bef3e2_$TextField
${txt_Industry}    id=What_x0020_industry_x0020_does_x_8a0a119f-5be8-47da-820a-bef7adc779ec_$DropDownChoice
${txt_Description}    id=What_x0020_is_x0020_your_x0020_s_3cd89882-52d4-4b6c-9dbf-e19ce0344ab6_$TextField
#Item 2
${txt_GrossRentals}   id=Gross_x0020_Rentals_x0020__x002d_32e514a3-9c56-4475-a170-a3e38c83e2f5_$TextField
${txt_ExpectedIncrease}    id=Gross_x0020_Rentals_x0020__x002d0_5762dace-91c6-47bf-b88c-e9d1d6c89018_$TextField 
${txt_GrowthRate}     id=Gross_x0020_Rentals_x0020__x002d1_eb8f7c52-1a84-454b-ab2b-20f22a5654f4_$TextField 
#Item 4
${txt_AddIncreaseCost}     id=Cost_x0020_of_x0020_Working_x002_53af590a-842d-4df5-b394-f967fee8fd3b_$TextField
#Saving
${btn_save}      xpath://input[@id='ctl00_ctl33_g_ad014a18_7556_40bb_8fe4_dfb25dd17b38_ctl00_toolBarTbl_RightRptControls_ctl00_ctl00_diidIOSaveItem']
${btn_WaitforSubmission}    xpath://a[text()='QN - Waiting for submission']
${btn_GenerateDoc}    xpath://input[@value='Generate Document']

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
    
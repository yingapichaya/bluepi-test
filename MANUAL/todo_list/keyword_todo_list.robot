*** Keywords ***
Open To Do List Url
    Open Browser    ${TO_DO_LIST_URL}    ${BROWSER}

Verify To Do List Page
    Title Should Be    ${TO_DO_LIST_TITLE}
    Element Text Should Be    ${TO_DO_LIST_LOCATOR}//h1    ${TO_DO_LIST}
    Element Text Should Be    ${TAB_BAR_LOCATOR}//a[1]    ${ADD_ITEM}
    Element Text Should Be    ${TAB_BAR_LOCATOR}//a[2]    ${TO_DO_TASKS}
    Element Text Should Be    ${TAB_BAR_LOCATOR}//a[3]    ${COMPLETED}

Verify To Do Tasks
    [Arguments]    ${total_list}
    ...    @{item_name_list}
    Click Element    ${TO_DO_TASKS_LOCATOR}
    ${count}=    Get Element Count    ${INCOMPLETED_TASK}
    Should Be Equal As Strings    ${count}    ${total_list}
    FOR    ${index}    ${item}    IN ENUMERATE    @{item_name_list}
        Element Text Should Be    ${ITEM_ID}${index+1}    ${item}
    END

Add Item
    [Arguments]    ${item_name}
    Click Element    ${ADD_ITEM_LOCATOR}
    Input Text    ${ADD_ITEM_FIELD}    ${item_name}
    Click Element    ${ADD_BUTTON}

Complete Item
    [Arguments]    ${item_locator}
    Click Element    ${TO_DO_TASKS_LOCATOR}
    Click Element    ${item_locator}

Verify Completed Tasks
    [Arguments]    ${item_name}
    Click Element    ${COMPLETED_TASKS_LOCATOR}
    Element Should Contain    ${COMPLETED_TASK}    ${item_name}

Delete Tasks
    [Arguments]    ${tab}
    Click Element    ${tab}
    Click Element    ${DELETE_BUTTON}
*** Settings ***
Library         Selenium2Library
Resource        data.robot
Resource        keyword_todo_list.robot
Test Setup      Run Keywords
...             Open To Do List Url

*** Test Cases ***
Verify To Do List Page
    Verify To Do List Page

Create To Do List - Success
    Verify To Do Tasks  @{ZERO_ITEM_LIST}
    Add Item            ${FIRST_ITEM_NAME}
    Verify To Do Tasks  @{ONE_ITEM_LIST}
    Add Item            ${SECOND_ITEM_NAME}
    Verify To Do Tasks  @{TWO_ITEM_LIST}

Complete To Do List - Success
    Add Item                ${FIRST_ITEM_NAME}
    Complete Item           ${FIRST_ITEM_LOCATOR}
    Verify To Do Tasks      @{ZERO_ITEM_LIST}
    Verify Completed Tasks  ${FIRST_ITEM_NAME}

Delete To Do List - Success
    Add Item            ${FIRST_ITEM_NAME}
    Delete Tasks        ${TO_DO_TASKS_LOCATOR}
    Verify To Do Tasks  @{ZERO_ITEM_LIST}

Delete Completed List - Success
    Add Item            ${FIRST_ITEM_NAME}
    Complete Item       ${FIRST_ITEM_LOCATOR}
    Delete Tasks        ${COMPLETED_TASKS_LOCATOR}
    Verify To Do Tasks  @{ZERO_ITEM_LIST}
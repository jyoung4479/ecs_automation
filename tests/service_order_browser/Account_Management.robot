| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |
| Resource       | ../../resources/keywords/login_page/login.robot |

| *** Test Cases *** |
| Heading |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='am-title'] |
|    | ${value} | Set Variable | Account Management |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Billing Contact |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='am-billingContact'] |
|    | ${value} | Set Variable | Russell, Derek |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Billing Address |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='am-billingAddress'] |
|    | # | Billing Address Line 1 |
|    | ${value} | Set Variable | 5810 Tower St S |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |
|    | # | Billing Address Line 2 |
|    | ${value} | Set Variable | Rockford, MN \ 55373 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |
|    | # | Billing Address Line 3 |
|    | ${value} | Set Variable | US |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Bank Draft |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='am-backDraft'] |
|    | ${value} | Set Variable | Bank Draft |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Billing Type |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='am-billingType'] |
|    | ${value} | Set Variable | Standard |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Grid Column Headings |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='am-container'] .k-grid-header |
|    | @{column_headings} | Create List | Account No | Status | Type | Service Address |
|    | kw Verify Grid Column Headings | ${element_locator} | @{column_headings} |

| Grid Column Account No |
|    | Log | Need SO with Account Management - Account Number Field value | level=WARN |
|    | Comment | ${element_locator} | Set Variable | jquery=[data-test-id='am-container'] .k-grid-content |
|    | Comment | ${value} | Set Variable | This is Service Order Task Note |
|    | Comment | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Status |
|    | Log | Need SO with Account Management - Status Field value | level=WARN |
|    | Comment | ${element_locator} | Set Variable | jquery=[data-test-id='am-container'] .k-grid-content |
|    | Comment | ${value} | Set Variable | This is Service Order Task Note |
|    | Comment | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Type |
|    | Log | Need SO with Account Management - Account Type Field value | level=WARN |
|    | Comment | ${element_locator} | Set Variable | jquery=[data-test-id='am-container'] .k-grid-content |
|    | Comment | ${value} | Set Variable | This is Service Order Task Note |
|    | Comment | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Service Address |
|    | Log | Need SO with Account Management - Service Address Field value | level=WARN |
|    | Comment | ${element_locator} | Set Variable | jquery=[data-test-id='am-container'] .k-grid-content |
|    | Comment | ${value} | Set Variable | This is Service Order Task Note |
|    | Comment | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| *** Keywords *** |
| kw Suite Setup |
|    | kw Open and Maximize Browser |
|    | Set Selenium Speed | 0 s |
|    | Set Browser Implicit Wait | 120 s |
|    | Set Selenium Implicit Wait | 120 s |
|    | Set Selenium Timeout | 120 s |
|    | Set Global Variable | ${var_URL} | http://192.168.1.33:2915 |
|    | Set Global Variable | ${var_SERVICE_ORDER_ID} | 716729 |
|    | kw Login |
|    | kw Go To Service Order | ${var_SERVICE_ORDER_ID} |

| kw Suite Teardown |
|    | Run Keyword And Ignore Error | Close All Browsers |

| kw Case Setup |
|    | kw Hide StickyHeader |

| kw Case Teardown |
|    | ${screenshot_filename} | Set Variable | C:\\ecs_automation_screenshots\\${TEST_NAME}-${TEST_STATUS}.png |
|    | Run Keyword If Test Failed | Capture Page Screenshot | filename=${screenshot_filename} |
|    | Run Keyword If Test Failed | kw Log Message | LAST ERROR MESSAGE:\t | ${var_ERROR_MESSAGE} | ${SPACE} | level=WARN |
|    | Run Keyword If Test Failed | kw Log Message | ${screenshot_filename} | level=WARN |

| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |
| Resource       | ../../resources/keywords/login_page/login.robot |

| *** Test Cases *** |
| Heading |
|    | ${value} | Set Variable | Account Management |
|    | kw Wait Until Element Visible | jquery=[data-test-id='am-title'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='am-title'] | ${value} |

| Billing Contact |
|    | ${value} | Set Variable | Russell, Derek |
|    | kw Wait Until Element Visible | jquery=[data-test-id='am-billingContact'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='am-billingContact'] | ${value} |

| Billing Address |
|    | ${value} | Set Variable | 5810 Tower St S |
|    | kw Wait Until Element Visible | jquery=[data-test-id='am-billingAddress'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='am-billingAddress'] | ${value} |
|    | ${value} | Set Variable | Rockford, MN \ 55373 |
|    | kw Wait Until Element Contains | jquery=[data-test-id='am-billingAddress'] | ${value} |
|    | ${value} | Set Variable | US |
|    | kw Wait Until Element Contains | jquery=[data-test-id='am-billingAddress'] | ${value} |

| Bank Draft |
|    | ${value} | Set Variable | Bank Draft |
|    | kw Wait Until Element Visible | jquery=[data-test-id='am-backDraft'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='am-backDraft'] | ${value} |

| Billing Type |
|    | ${value} | Set Variable | Standard |
|    | kw Wait Until Element Visible | jquery=[data-test-id='am-billingType'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='am-billingType'] | ${value} |

| Grid Column Headings |
|    | @{column_headings} | Create List | Account No | Status | Type | Service Address |
|    | : FOR | ${heading} | IN | @{column_headings} |
|    |    | kw Wait Until Element Visible | jquery=[data-test-id='am-container'] .k-grid-header |
|    |    | kw Wait Until Element Contains | jquery=[data-test-id='am-container'] .k-grid-header | ${heading} |

| Grid Column Account No |
|    | Log | Need to Implement! | level=WARN |
|    | Comment | ${value} | Set Variable | This is Service Order Task Note |
|    | Comment | kw Wait Until Element Visible | jquery=[data-test-id='tasks-container'] td:contains('${value}') |
|    | Comment | kw Wait Until Element Contains | jquery=[data-test-id='tasks-container'] td:contains('${value}') | ${value} |

| Grid Column Status |
|    | Log | Need to Implement! | level=WARN |
|    | Comment | ${value} | Set Variable | This is Service Order Task Note |
|    | Comment | kw Wait Until Element Visible | jquery=[data-test-id='tasks-container'] td:contains('${value}') |
|    | Comment | kw Wait Until Element Contains | jquery=[data-test-id='tasks-container'] td:contains('${value}') | ${value} |

| Grid Column Type |
|    | Log | Need to Implement! | level=WARN |
|    | Comment | ${value} | Set Variable | This is Service Order Task Note |
|    | Comment | kw Wait Until Element Visible | jquery=[data-test-id='tasks-container'] td:contains('${value}') |
|    | Comment | kw Wait Until Element Contains | jquery=[data-test-id='tasks-container'] td:contains('${value}') | ${value} |

| Grid Column Service Address |
|    | Log | Need to Implement! | level=WARN |
|    | Comment | ${value} | Set Variable | This is Service Order Task Note |
|    | Comment | kw Wait Until Element Visible | jquery=[data-test-id='tasks-container'] td:contains('${value}') |
|    | Comment | kw Wait Until Element Contains | jquery=[data-test-id='tasks-container'] td:contains('${value}') | ${value} |

| *** Keywords *** |
| kw Suite Setup |
|    | kw Open and Maximize Browser |
|    | Set Selenium Speed | 0 s |
|    | Set Browser Implicit Wait | 120 s |
|    | Set Selenium Implicit Wait | 120 s |
|    | Set Selenium Timeout | 120 s |
|    | Set Global Variable | ${var_URL} | http://192.168.1.33:2915 |
|    | kw Login | ${var_URL} | ${var_USERNAME} | ${var_PASSWORD} |
|    | kw Go To Service Order | ${var_SERVICE_ORDER_ID} |

| kw Suite Teardown |
|    | Run Keyword And Ignore Error | Close All Browsers |

| kw Case Setup |
|    | kw Hide StickyHeader |

| kw Case Teardown |
|    | ${screenshot_filename} | Set Variable | C:\\ecs_automation_screenshots\\${TEST_NAME}-${TEST_STATUS}.png |
|    | Run Keyword If Test Failed | Capture Page Screenshot | filename=${screenshot_filename} |
|    | Run Keyword If Test Failed | kw Log Message | ${var_CURRENT_ERROR_MESSAGE} | level=WARN |
|    | Run Keyword If Test Failed | kw Log Message | ${screenshot_filename} | level=WARN |

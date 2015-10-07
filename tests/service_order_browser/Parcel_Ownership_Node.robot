| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |
| Resource       | ../../resources/keywords/login_page/login.robot |

| *** Test Cases *** |
| Heading |
|    | ${value} | Set Variable | Tasks |
|    | kw Wait Until Element Visible | jquery=[data-test-id='tasks-title'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='tasks-title'] | ${value} |

| Grid Column Headings |
|    | @{column_headings} | Create List | Task | Note | Completion Date | Scheduled Date |
|    | : FOR | ${heading} | IN | @{column_headings} |
|    |    | kw Wait Until Element Visible | jquery=[data-test-id='tasks-container'] .k-grid-header |
|    |    | kw Wait Until Element Contains | jquery=[data-test-id='tasks-container'] .k-grid-header | ${heading} |

| Grid Column Name |
|    | ${value} | Set Variable | ServiceOrder Task 1 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='tasks-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='tasks-container'] td:contains('${value}') | ${value} |

| Grid Column Note |
|    | ${value} | Set Variable | This is Service Order Task Note |
|    | kw Wait Until Element Visible | jquery=[data-test-id='tasks-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='tasks-container'] td:contains('${value}') | ${value} |

| Grid Column Completion Date |
|    | ${value} | Set Variable | October 30, 2015 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='tasks-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='tasks-container'] td:contains('${value}') | ${value} |

| Grid Column Scheduled Date |
|    | ${value} | Set Variable | August 7, 2015 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='tasks-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='tasks-container'] td:contains('${value}') | ${value} |

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

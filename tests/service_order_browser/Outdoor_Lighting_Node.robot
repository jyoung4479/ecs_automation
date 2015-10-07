| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |
| Resource       | ../../resources/keywords/login_page/login.robot |

| *** Test Cases *** |
| Heading |
|    | ${value} | Set Variable | Outdoor Lighting |
|    | kw Wait Until Element Visible | jquery=[data-test-id='lighting-title'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='lighting-title'] | ${value} |

| Grid Column Headings |
|    | @{column_headings} | Create List | Attached To | SL Map No | Physical Location | Service Light | Svc Map No |
|    | ... | Status | Billed | View |
|    | : FOR | ${heading} | IN | @{column_headings} |
|    |    | kw Wait Until Element Visible | jquery=[data-test-id='lighting-container'] .k-grid-header |
|    |    | kw Wait Until Element Contains | jquery=[data-test-id='lighting-container'] .k-grid-header | ${heading} |

| Grid Column Attached To |
|    | ${value} | Set Variable | Account |
|    | kw Wait Until Element Visible | jquery=[data-test-id='lighting-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='lighting-container'] td:contains('${value}') | ${value} |

| Grid Column SL Map Number |
|    | ${value} | Set Variable | 1151104 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='lighting-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='lighting-container'] td:contains('${value}') | ${value} |

| Grid Column Physical Location |
|    | ${value} | Set Variable | This is Physical Location |
|    | kw Wait Until Element Visible | jquery=[data-test-id='lighting-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='lighting-container'] td:contains('${value}') | ${value} |

| Grid Column Service Light |
|    | Log | Need To Implement! | level=WARN |
|    | Comment | ${value} | Set Variable | August 7, 2015 |
|    | Comment | kw Wait Until Element Visible | jquery=[data-test-id='lighting-container'] td:contains('${value}') |
|    | Comment | kw Wait Until Element Contains | jquery=[data-test-id='lighting-container'] td:contains('${value}') | ${value} |

| Grid Column Svc Map No |
|    | ${value} | Set Variable | 21 29BD0104107 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='lighting-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='lighting-container'] td:contains('${value}') | ${value} |

| Grid Column Status |
|    | ${value} | Set Variable | Burning |
|    | kw Wait Until Element Visible | jquery=[data-test-id='lighting-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='lighting-container'] td:contains('${value}') | ${value} |

| Grid Column Billed |
|    | kw Wait Until Element Visible | jquery=[data-test-id='lighting-container'] td .accent-completed |

| Grid Column View |
|    | ${value} | Set Variable | Journal |
|    | kw Wait Until Element Visible | jquery=[data-test-id='lighting-container'] td>button |

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

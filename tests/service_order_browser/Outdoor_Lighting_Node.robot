| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |
| Resource       | ../../resources/keywords/login_page/login.robot |

| *** Test Cases *** |
| Heading |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='lighting-title'] |
|    | ${value} | Set Variable | Outdoor Lighting |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Grid Column Headings |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='lighting-container'] .k-grid-header |
|    | @{column_headings} | Create List | Attached To | SL Map No | Physical Location | Service Light | Svc Map No |
|    | ... | Status | Billed | View |
|    | kw Verify Grid Column Headings | ${element_locator} | @{column_headings} |

| Grid Column Attached To |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='lighting-container'] .k-grid-content |
|    | ${value} | Set Variable | Account |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column SL Map Number |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='lighting-container'] .k-grid-content |
|    | ${value} | Set Variable | 1151104 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Physical Location |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='lighting-container'] .k-grid-content |
|    | ${value} | Set Variable | This is Physical Location |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Service Light |
|    | Log | Need To Implement! | level=WARN |
|    | Comment | ${element_locator} | Set Variable | jquery=[data-test-id='lighting-container'] .k-grid-content |
|    | Comment | ${value} | Set Variable | August 7, 2015 |
|    | Comment | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Svc Map No |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='lighting-container'] .k-grid-content |
|    | ${value} | Set Variable | 21 29BD0104107 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Status |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='lighting-container'] .k-grid-content |
|    | ${value} | Set Variable | Burning |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Billed |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='lighting-container'] .k-grid-content \ .accent-completed |
|    | kw Wait Until Element Visible | ${element_locator} |

| Grid Column View |
|    | ${value} | Set Variable | Journal |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='lighting-container'] .k-grid-content |
|    | kw Wait Until Element Visible | ${element_locator} |

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

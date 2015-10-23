| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |
| Resource       | ../../resources/keywords/login_page/login.robot |

| *** Test Cases *** |
| Heading |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='sp-title'] |
|    | ${value} | Set Variable | Surge Protectors |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Grid Column Headings |
|    | @{column_headings} | Create List | Serial Number | Status | Type | Set | Removed |
|    | ... | Charge | View |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='sp-container'] .k-grid-header |
|    | kw Verify Grid Column Headings | ${element_locator} | @{column_headings} |

| Grid Column Serial Number |
|    | ${value} | Set Variable | 1 |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='sp-container'] .k-grid-content |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Status |
|    | Log | Need To Implement! | level=WARN |
|    | Comment | ${element_locator} | Set Variable | jquery=[data-test-id='sp-container'] .k-grid-content |
|    | Comment | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Type |
|    | ${value} | Set Variable | HG3 |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='sp-container'] .k-grid-content |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Set |
|    | ${value} | Set Variable | August 27, 2015 |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='sp-container'] .k-grid-content |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Removed |
|    | Log | Need To Implement! | level=WARN |
|    | Comment | ${element_locator} | Set Variable | jquery=[data-test-id='sp-container'] .k-grid-content |
|    | Comment | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Charge |
|    | ${value} | Set Variable | 1 |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='sp-container'] .k-grid-content |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column View |
|    | ${value} | Set Variable | Journal |
|    | kw Wait Until Element Visible | jquery=[data-test-id='sp-container'] .k-grid-content \ button |

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

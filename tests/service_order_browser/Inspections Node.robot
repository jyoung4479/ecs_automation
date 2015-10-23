| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |
| Resource       | ../../resources/keywords/login_page/login.robot |

| *** Test Cases *** |
| Heading |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='inspections-title'] |
|    | ${value} | Set Variable | Inspections |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Grid Column Headings |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='inspections-container'] .k-grid-header |
|    | @{column_headings} | Create List | Ticket | Agency | Inspection Date | Inspected By | Inspection Type |
|    | ... | Note | Date Entered | Entered By |
|    | kw Verify Grid Column Headings | ${element_locator} | @{column_headings} |

| Grid Column Ticket |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='inspections-container'] \ .k-grid-content |
|    | ${value} | Set Variable | 8675309 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Agency |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='inspections-container'] \ .k-grid-content |
|    | ${value} | Set Variable | Licensed Electrician |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Inspection Date |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='inspections-container'] \ .k-grid-content |
|    | ${value} | Set Variable | August 7, 2015 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Inspected By |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='inspections-container'] \ .k-grid-content |
|    | ${value} | Set Variable | Jeff Young |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Inspection Type |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='inspections-container'] \ .k-grid-content |
|    | ${value} | Set Variable | Permanent |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Note |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='inspections-container'] \ .k-grid-content |
|    | ${value} | Set Variable | This is a Note from inspection! |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Date Entered |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='inspections-container'] \ .k-grid-content |
|    | ${value} | Set Variable | August 7, 2015 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Entered By |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='inspections-container'] \ .k-grid-content |
|    | ${value} | Set Variable | Conversion |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

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

| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |
| Resource       | ../../resources/keywords/login_page/login.robot |

| *** Test Cases *** |
| Heading |
|    | ${value} | Set Variable | Inspections |
|    | kw Wait Until Element Visible | jquery=[data-test-id='inspections-title'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='inspections-title'] | ${value} |

| Tasks Grid Column Headings |
|    | @{column_headings} | Create List | Ticket | Agency | Inspection Date | Inspected By | Inspection Type |
|    | ... | Note | Date Entered | Entered By |
|    | : FOR | ${heading} | IN | @{column_headings} |
|    |    | kw Wait Until Element Visible | jquery=[data-test-id='inspections-container'] .k-grid-header |
|    |    | kw Wait Until Element Contains | jquery=[data-test-id='inspections-container'] .k-grid-header | ${heading} |

| Grid Column Ticket |
|    | ${value} | Set Variable | 8675309 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='inspections-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='inspections-container'] td:contains('${value}') | ${value} |

| Grid Column Agency |
|    | ${value} | Set Variable | Licensed Electrician |
|    | kw Wait Until Element Visible | jquery=[data-test-id='inspections-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='inspections-container'] td:contains('${value}') | ${value} |

| Grid Column Inspection Date |
|    | ${value} | Set Variable | August 7, 2015 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='inspections-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='inspections-container'] td:contains('${value}') | ${value} |

| Grid Column Inspected By |
|    | ${value} | Set Variable | Jeff Young |
|    | kw Wait Until Element Visible | jquery=[data-test-id='inspections-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='inspections-container'] td:contains('${value}') | ${value} |

| Grid Column Inspection Type |
|    | ${value} | Set Variable | Permanent |
|    | kw Wait Until Element Visible | jquery=[data-test-id='inspections-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='inspections-container'] td:contains('${value}') | ${value} |

| Grid Column Note |
|    | ${value} | Set Variable | This is a Note from inspection! |
|    | kw Wait Until Element Visible | jquery=[data-test-id='inspections-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='inspections-container'] td:contains('${value}') | ${value} |

| Grid Column Date Entered |
|    | ${value} | Set Variable | August 7, 2015 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='inspections-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='inspections-container'] td:contains('${value}') | ${value} |

| Grid Column Entered By |
|    | ${value} | Set Variable | Conversion |
|    | kw Wait Until Element Visible | jquery=[data-test-id='inspections-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='inspections-container'] td:contains('${value}') | ${value} |

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

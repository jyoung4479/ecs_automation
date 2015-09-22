| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |
| Resource       | ../../resources/keywords/login_page/login.robot |

| *** Test Cases *** |
| Tasks Heading |
|    | ${value} | Set Variable | Tasks |
|    | kw Wait Until Element Visible | jquery=[data-test-id='tasks-title'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='tasks-title'] | ${value} |

| Tasks Grid Column Headings |
|    | ${value} | Set Variable | Tasks |
|    | kw Wait Until Element Visible | jquery=h4:contains('${value}') |
|    | ${value} | Set Variable | Task |
|    | kw Wait Until Element Visible | jquery=div[scroll-target='AppNode4']:contains('Tasks') th[data-title='${value}'] |
|    | kw Wait Until Element Contains | jquery=div[scroll-target='AppNode4']:contains('Tasks') th[data-title='${value}'] | ${value} |
|    | ${value} | Set Variable | Note |
|    | kw Wait Until Element Visible | jquery=div[scroll-target='AppNode4']:contains('Tasks') th[data-title='${value}'] |
|    | kw Wait Until Element Contains | jquery=div[scroll-target='AppNode4']:contains('Tasks') th[data-title='${value}'] | ${value} |
|    | ${value} | Set Variable | Completion Date |
|    | kw Wait Until Element Visible | jquery=div[scroll-target='AppNode4']:contains('Tasks') th[data-title='${value}'] |
|    | kw Wait Until Element Contains | jquery=div[scroll-target='AppNode4']:contains('Tasks') th[data-title='${value}'] | ${value} |
|    | ${value} | Set Variable | Scheduled Date |
|    | kw Wait Until Element Visible | jquery=div[scroll-target='AppNode4']:contains('Tasks') th[data-title='${value}'] |
|    | kw Wait Until Element Contains | jquery=div[scroll-target='AppNode4']:contains('Tasks') th[data-title='${value}'] | ${value} |

| Task Name |
|    | ${value} | Set Variable | ServiceOrder Task 1 |
|    | kw Wait Until Element Visible | jquery=[ng-bind*='description'] |
|    | kw Wait Until Element Contains | jquery=[ng-bind*='description'] | ${value} |

| Task Note |
|    | ${value} | Set Variable | This is Service Order Task Note |
|    | kw Wait Until Element Visible | jquery=[ng-bind*='note'] |
|    | kw Wait Until Element Contains | jquery=[ng-bind*='note'] | ${value} |

| Task Completion Date |
|    | ${value} | Set Variable | October 30, 2015 |
|    | kw Wait Until Element Visible | jquery=div[scroll-target='AppNode4'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=div[scroll-target='AppNode4'] td:contains('${value}') | ${value} |

| Task Scheduled Date |
|    | ${value} | Set Variable | August 7, 2015 |
|    | kw Wait Until Element Visible | jquery=div[scroll-target='AppNode4'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=div[scroll-target='AppNode4'] td:contains('${value}') | ${value} |

| *** Keywords *** |
| kw Suite Setup |
|    | kw Open and Maximize Browser |
|    | Set Selenium Speed | 0 s |
|    | Set Browser Implicit Wait | 120 s |
|    | Set Selenium Implicit Wait | 120 s |
|    | Set Selenium Timeout | 120 s |
|    | kw Login | ${var_URL} | ${var_USERNAME} | ${var_PASSWORD} |
|    | kw Go To Service Order | ${var_SERVICE_ORDER_ID} |

| kw Suite Teardown |
|    | Run Keyword And Ignore Error | Close All Browsers |

| kw Case Setup |
|    | kw Hide StickyHeader |

| kw Case Teardown |
|    | Run Keyword If Test Failed | Capture Page Screenshot |

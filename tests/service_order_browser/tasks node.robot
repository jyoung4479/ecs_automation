| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |

| *** Test Cases *** |
| Heading |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='tasks-title'] |
|    | ${value} | Set Variable | Tasks |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Grid Column Headings |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='tasks-container'] .k-grid-header |
|    | @{column_headings} | Create List | Task | Note | Completion Date | Scheduled Date |
|    | kw Verify Grid Column Headings | ${element_locator} | @{column_headings} |

| Grid Column Name |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='tasks-container'] .k-grid-content |
|    | ${value} | Set Variable | ServiceOrder Task 1 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Note |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='tasks-container'] .k-grid-content |
|    | ${value} | Set Variable | This is Service Order Task Note |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Completion Date |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='tasks-container'] .k-grid-content |
|    | ${value} | Set Variable | October 30, 2015 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Scheduled Date |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='tasks-container'] .k-grid-content |
|    | ${value} | Set Variable | August 7, 2015 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| *** Keywords *** |
| kw Case Setup |
|    | kw Hide StickyHeader |

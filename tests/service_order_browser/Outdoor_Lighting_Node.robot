| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |

| *** Test Cases *** |
| Heading |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='lighting-title'] |
|    | ${value} | Set Variable | Outdoor Lighting |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

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
| kw Case Setup |
|    | kw Hide StickyHeader |

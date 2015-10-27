| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |

| *** Test Cases *** |
| Heading |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='sp-title'] |
|    | ${value} | Set Variable | Surge Protectors |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

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
| kw Case Setup |
|    | kw Hide StickyHeader |

| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |

| *** Test Cases *** |
| Heading |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='attributes-title'] |
|    | ${value} | Set Variable | Attributes |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Grid Column Headings |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='attributes-container'] .k-grid-header |
|    | @{column_headings} | Create List | Attribute Description | Attribute Value | Cutoff Eligible | Priority | Creation Date |
|    | kw Verify Grid Column Headings | ${element_locator} | @{column_headings} |

| Grid Column Attribute Description |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='attributes-container'] \ .k-grid-content |
|    | ${value} | Set Variable | Mobile Order Status |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Attribute Value |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='attributes-container'] \ .k-grid-content |
|    | ${value} | Set Variable | 123456 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Cutoff Eligible |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='attributes-container'] \ .k-grid-content .accent-completed |
|    | kw Wait Until Element Visible | ${element_locator} |

| Grid Column Priority |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='attributes-container'] \ .k-grid-content |
|    | ${value} | Set Variable | NORMAL |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Expiration Date |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='attributes-container'] \ .k-grid-content |
|    | ${value} | Set Variable | March 31, 2016 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Creation Date |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='attributes-container'] \ .k-grid-content |
|    | ${value} | Set Variable | August 7, 2015 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| *** Keywords *** |
| kw Case Setup |
|    | kw Hide StickyHeader |

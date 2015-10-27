| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |

| *** Test Cases *** |
| Heading |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='inspections-title'] |
|    | ${value} | Set Variable | Inspections |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

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
| kw Case Setup |
|    | kw Hide StickyHeader |

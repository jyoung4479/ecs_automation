| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |

| *** Test Cases *** |
| Heading |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='parcel-title'] |
|    | ${value} | Set Variable | Parcel Ownership |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Grid Column Headings |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='parcel-container'] |
|    | @{column_headings} | Create List | Parcel ID | Acreage | Customer | Created On | Created By |
|    | kw Verify Grid Column Headings | ${element_locator} | @{column_headings} |

| Grid Column Parcel ID |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='parcel-container'] |
|    | ${value} | Set Variable | 113028001030 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Acreage |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='parcel-container'] |
|    | ${value} | Set Variable | 2.3218 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Customer |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='parcel-container'] |
|    | ${value} | Set Variable | 1010005 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Created On |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='parcel-container'] |
|    | ${value} | Set Variable | November 23, 2010 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Created By |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='parcel-container'] |
|    | ${value} | Set Variable | Conversion |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| *** Keywords *** |
| kw Case Setup |
|    | kw Hide StickyHeader |

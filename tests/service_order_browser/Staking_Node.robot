| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |

| *** Test Cases *** |
| Heading |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='staking-title'] |
|    | ${value} | Set Variable | Staking |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Grid Column Headings |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='staking-container'] [data-test-id='staking-details'] |
|    | @{column_headings} | Create List | Street Type | Township | Crew Code | Service Eligible | Pole Line Footage |
|    | kw Verify Grid Column Headings | ${element_locator} | @{column_headings} |

| Grid Column Street Type |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='staking-container'] [data-test-id='staking-details'] |
|    | ${value} | Set Variable | 601M |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Township |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='staking-container'] [data-test-id='staking-details'] |
|    | ${value} | Set Variable | Rockford W 883 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Crew Code |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='staking-container'] [data-test-id='staking-details'] |
|    | ${value} | Set Variable | Service Crew |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Service Eligible |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='staking-container'] [data-test-id='staking-details'] |
|    | ${value} | Set Variable | Yes |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Pole Line Footage |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='staking-container'] [data-test-id='staking-details'] |
|    | ${value} | Set Variable | 5 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| *** Keywords *** |
| kw Case Setup |
|    | kw Hide StickyHeader |

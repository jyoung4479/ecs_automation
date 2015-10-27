| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |

| *** Test Cases *** |
| Heading |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='location-title'] |
|    | ${value} | Set Variable | Service Location |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Service Address |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='location-address'] |
|    | ${value} | Set Variable | 5810 Tower St S |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |
|    | ${value} | Set Variable | Rockford, MN \ 55373 |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |
|    | ${value} | Set Variable | US |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Location Notes |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='location-notes'] |
|    | ${value} | Set Variable | This is Address Comment |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Service Type |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='location-serviceType'] |
|    | ${value} | Set Variable | 01 Residential Sales |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Auto Reconnect Account Number |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='location-autoReconnectAccountNumber'] |
|    | ${value} | Set Variable | Not Assigned |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Meter Number |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='location-meterNumber'] |
|    | ${value} | Set Variable | 91623809, Master |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Rate Code |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='location-rateCode'] |
|    | ${value} | Set Variable | 10 |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Multiplier |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='location-multiplier'] |
|    | ${value} | Set Variable | 1 |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Near Map Number |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='location-nearMapNumber'] |
|    | ${value} | Set Variable | 05 22DB0101004W |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| *** Keywords *** |
| kw Case Setup |
|    | kw Hide StickyHeader |

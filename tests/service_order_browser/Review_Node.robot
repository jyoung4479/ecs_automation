| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |

| *** Test Cases *** |
| Heading |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='review-title'] |
|    | ${value} | Set Variable | Review |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| *** Keywords *** |
| kw Case Setup |
|    | kw Hide StickyHeader |

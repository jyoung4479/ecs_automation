| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |

| *** Test Cases *** |
| Service Type |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-serviceType'] |
|    | ${value} | Set Variable | 1 Ph Transformer Change Out |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Status |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-status'] |
|    | ${value} | Set Variable | OnHold |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Number |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-number'] |
|    | ${value} | Set Variable | 716729 |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Required By Date |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-requiredByDate'] |
|    | ${value} | Set Variable | August 7, 2015 |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Owner |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-owner'] |
|    | ${value} | Set Variable | Not Owned |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Requested By Name |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-requestedBy-name'] |
|    | ${value} | Set Variable | Russell, Derek |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Instructions |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-instructions'] |
|    | ${value} | Set Variable | This is Crew Instructions |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Requested By Phone |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-requestedBy-phone'] |
|    | ${value} | Set Variable | (612) 998-6485 |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Assigned To |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-assignedTo'] |
|    | ${value} | kw Change Assigned To Value |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |
|    | Comment | Reload Page |
|    | Comment | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Activity Center |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-activityCenter'] |
|    | ${value} | kw Change Activity Center Value |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |
|    | Reload Page |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| *** Keywords *** |
| kw Case Setup |
|    | kw Hide StickyHeader |

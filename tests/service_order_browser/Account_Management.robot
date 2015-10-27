| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |

| *** Test Cases *** |
| Heading |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='am-title'] |
|    | ${value} | Set Variable | Account Management |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Billing Contact |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='am-billingContact'] |
|    | ${value} | Set Variable | Russell, Derek |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Billing Address |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='am-billingAddress'] |
|    | # | Billing Address Line 1 |
|    | ${value} | Set Variable | 5810 Tower St S |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |
|    | # | Billing Address Line 2 |
|    | ${value} | Set Variable | Rockford, MN \ 55373 |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |
|    | # | Billing Address Line 3 |
|    | ${value} | Set Variable | US |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Bank Draft |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='am-backDraft'] |
|    | ${value} | Set Variable | Bank Draft |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Billing Type |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='am-billingType'] |
|    | ${value} | Set Variable | Standard |
|    | kw Verify Element Contains Value | ${element_locator} | ${value} |

| Grid Column Headings |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='am-container'] .k-grid-header |
|    | @{column_headings} | Create List | Account No | Status | Type | Service Address |
|    | kw Verify Grid Column Headings | ${element_locator} | @{column_headings} |

| Grid Column Account No |
|    | Log | Need SO with Account Management - Account Number Field value | level=WARN |
|    | Comment | ${element_locator} | Set Variable | jquery=[data-test-id='am-container'] .k-grid-content |
|    | Comment | ${value} | Set Variable | This is Service Order Task Note |
|    | Comment | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Status |
|    | Log | Need SO with Account Management - Status Field value | level=WARN |
|    | Comment | ${element_locator} | Set Variable | jquery=[data-test-id='am-container'] .k-grid-content |
|    | Comment | ${value} | Set Variable | This is Service Order Task Note |
|    | Comment | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Type |
|    | Log | Need SO with Account Management - Account Type Field value | level=WARN |
|    | Comment | ${element_locator} | Set Variable | jquery=[data-test-id='am-container'] .k-grid-content |
|    | Comment | ${value} | Set Variable | This is Service Order Task Note |
|    | Comment | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Service Address |
|    | Log | Need SO with Account Management - Service Address Field value | level=WARN |
|    | Comment | ${element_locator} | Set Variable | jquery=[data-test-id='am-container'] .k-grid-content |
|    | Comment | ${value} | Set Variable | This is Service Order Task Note |
|    | Comment | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| *** Keywords *** |
| kw Case Setup |
|    | kw Hide StickyHeader |

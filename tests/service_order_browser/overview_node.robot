| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |
| Resource       | ../../resources/keywords/login_page/login.robot |

| *** Test Cases *** |
| Service Type |
|    | ${value} | Set Variable | 1 Ph Transformer Change Out |
|    | kw Wait Until Element Visible | jquery=[data-test-id='so-serviceType'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='so-serviceType'] | ${value} |

| Status |
|    | ${value} | Set Variable | OnHold |
|    | kw Wait Until Element Visible | jquery=[data-test-id='so-status'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='so-status'] | ${value} |

| Number |
|    | ${value} | Set Variable | 716729 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='so-number'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='so-number'] | ${value} |

| Required By Date |
|    | ${value} | Set Variable | August 7, 2015 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='so-requiredByDate'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='so-requiredByDate'] | ${value} |

| Branch |
|    | ${value} | Set Variable | Delivered To QualComm |
|    | kw Wait Until Element Visible | jquery=[data-test-id='so-activityCenter'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='so-activityCenter'] | ${value} |

| Assigned To |
|    | ${value} | Set Variable | Not Assigned |
|    | kw Wait Until Element Visible | jquery=[data-test-id='so-assignedTo'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='so-assignedTo'] | ${value} |

| Owner |
|    | ${value} | Set Variable | HEATHER KADLEC |
|    | kw Wait Until Element Visible | jquery=[data-test-id='so-owner'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='so-owner'] | ${value} |

| Requested By Name |
|    | ${value} | Set Variable | Russell, Derek |
|    | kw Wait Until Element Visible | jquery=[data-test-id='so-requestedBy-name'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='so-requestedBy-name'] | ${value} |

| Instructions |
|    | ${value} | Set Variable | This is Crew Instructions |
|    | kw Wait Until Element Visible | jquery=[data-test-id='so-instructions'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='so-instructions'] | ${value} |

| Requested By Phone |
|    | ${value} | Set Variable | (612) 998-6485 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='so-requestedBy-phone'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='so-requestedBy-phone'] | ${value} |

| *** Keywords *** |
| kw Suite Setup |
|    | kw Open and Maximize Browser |
|    | Set Selenium Speed | 0 s |
|    | Set Browser Implicit Wait | 120 s |
|    | Set Selenium Implicit Wait | 120 s |
|    | Set Selenium Timeout | 120 s |
|    | Set Global Variable | ${var_URL} | http://192.168.1.33:2915 |
|    | kw Login | ${var_URL} | ${var_USERNAME} | ${var_PASSWORD} |
|    | kw Go To Service Order | ${var_SERVICE_ORDER_ID} |

| kw Suite Teardown |
|    | Run Keyword And Ignore Error | Close All Browsers |

| kw Case Setup |
|    | kw Hide StickyHeader |

| kw Case Teardown |
|    | Run Keyword If Test Failed | Capture Page Screenshot |

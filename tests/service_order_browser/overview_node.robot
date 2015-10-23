| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |
| Resource       | ../../resources/keywords/login_page/login.robot |

| *** Test Cases *** |
| Service Type |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-serviceType'] |
|    | ${value} | Set Variable | 1 Ph Transformer Change Out |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Status |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-status'] |
|    | ${value} | Set Variable | OnHold |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Number |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-number'] |
|    | ${value} | Set Variable | 716729 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Required By Date |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-requiredByDate'] |
|    | ${value} | Set Variable | August 7, 2015 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Branch |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-activityCenter'] |
|    | ${value} | Set Variable | AMIIncomplete |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Assigned To |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-assignedTo'] |
|    | ${value} | Set Variable | Jennifer Virnig |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Owner |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-owner'] |
|    | ${value} | Set Variable | Not Owned |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Requested By Name |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-requestedBy-name'] |
|    | ${value} | Set Variable | Russell, Derek |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Instructions |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-instructions'] |
|    | ${value} | Set Variable | This is Crew Instructions |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Requested By Phone |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='so-requestedBy-phone'] |
|    | ${value} | Set Variable | (612) 998-6485 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| *** Keywords *** |
| kw Suite Setup |
|    | kw Open and Maximize Browser |
|    | Set Selenium Speed | 0 s |
|    | Set Browser Implicit Wait | 120 s |
|    | Set Selenium Implicit Wait | 120 s |
|    | Set Selenium Timeout | 120 s |
|    | Set Global Variable | ${var_URL} | http://192.168.1.33:2915 |
|    | Set Global Variable | ${var_SERVICE_ORDER_ID} | 716729 |
|    | kw Login |
|    | kw Go To Service Order | ${var_SERVICE_ORDER_ID} |

| kw Suite Teardown |
|    | Run Keyword And Ignore Error | Close All Browsers |

| kw Case Setup |
|    | kw Hide StickyHeader |

| kw Case Teardown |
|    | ${screenshot_filename} | Set Variable | C:\\ecs_automation_screenshots\\${TEST_NAME}-${TEST_STATUS}.png |
|    | Run Keyword If Test Failed | Capture Page Screenshot | filename=${screenshot_filename} |
|    | Run Keyword If Test Failed | kw Log Message | LAST ERROR MESSAGE:\t | ${var_ERROR_MESSAGE} | ${SPACE} | level=WARN |
|    | Run Keyword If Test Failed | kw Log Message | ${screenshot_filename} | level=WARN |

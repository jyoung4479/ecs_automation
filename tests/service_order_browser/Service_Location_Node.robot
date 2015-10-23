| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |
| Resource       | ../../resources/keywords/login_page/login.robot |

| *** Test Cases *** |
| Heading |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='location-title'] |
|    | ${value} | Set Variable | Service Location |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Service Address |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='location-address'] |
|    | ${value} | Set Variable | 5810 Tower St S |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |
|    | ${value} | Set Variable | Rockford, MN \ 55373 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |
|    | ${value} | Set Variable | US |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Location Notes |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='location-notes'] |
|    | ${value} | Set Variable | This is Address Comment |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Service Type |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='location-serviceType'] |
|    | ${value} | Set Variable | 01 Residential Sales |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Auto Reconnect Account Number |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='location-autoReconnectAccountNumber'] |
|    | ${value} | Set Variable | Not Assigned |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Meter Number |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='location-meterNumber'] |
|    | ${value} | Set Variable | 91623809, Master |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Rate Code |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='location-rateCode'] |
|    | ${value} | Set Variable | 10 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Multiplier |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='location-multiplier'] |
|    | ${value} | Set Variable | 1 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Near Map Number |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='location-nearMapNumber'] |
|    | ${value} | Set Variable | 05 22DB0101004W |
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

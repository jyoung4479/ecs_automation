| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |
| Resource       | ../../resources/keywords/login_page/login.robot |

| *** Test Cases *** |
| Location Heading |
|    | ${value} | Set Variable | Service Location |
|    | kw Wait Until Element Visible | jquery=[data-test-id='location-title'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='location-title'] | ${value} |

| Service Address |
|    | ${value} | Set Variable | 5810 Tower St S |
|    | kw Wait Until Element Visible | jquery=[data-test-id='location-address'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='location-address'] | ${value} |
|    | ${value} | Set Variable | Rockford, MN \ 55373 |
|    | kw Wait Until Element Contains | jquery=[data-test-id='location-address'] | ${value} |
|    | ${value} | Set Variable | US |
|    | kw Wait Until Element Contains | jquery=[data-test-id='location-address'] | ${value} |

| Location Notes |
|    | ${value} | Set Variable | This is Address Comment |
|    | kw Wait Until Element Visible | jquery=[data-test-id='location-notes'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='location-notes'] | ${value} |

| Service Type |
|    | ${value} | Set Variable | 01 Residential Sales  |
|    | kw Wait Until Element Visible | jquery=[data-test-id='location-serviceType'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='location-serviceType'] | ${value} |

| Auto Reconnect Account Number |
|    | ${value} | Set Variable | Not Assigned |
|    | kw Wait Until Element Visible | jquery=[data-test-id='location-autoReconnectAccountNumber'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='location-autoReconnectAccountNumber'] | ${value} |

| Meter Number |
|    | ${value} | Set Variable | 91623809, Master |
|    | kw Wait Until Element Visible | jquery=[data-test-id='location-meterNumber'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='location-meterNumber'] | ${value} |

| Rate Code |
|    | ${value} | Set Variable | 10 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='location-rateCode'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='location-rateCode'] | ${value} |

| Multiplier |
|    | ${value} | Set Variable | 1 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='location-multiplier'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='location-multiplier'] | ${value} |

| Near Map Number |
|    | ${value} | Set Variable | 05 22DB0101004W |
|    | kw Wait Until Element Visible | jquery=[data-test-id='location-nearMapNumber'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='location-nearMapNumber'] | ${value} |

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
|    | ${screenshot_filename} | Set Variable | C:\\ecs_automation_screenshots\\${TEST_NAME}-${TEST_STATUS}.png |
|    | Run Keyword If Test Failed | Capture Page Screenshot | filename=${screenshot_filename} |
|    | Run Keyword If Test Failed | kw Log Message | ${var_CURRENT_ERROR_MESSAGE} | level=WARN |
|    | Run Keyword If Test Failed | kw Log Message | ${screenshot_filename} | level=WARN |

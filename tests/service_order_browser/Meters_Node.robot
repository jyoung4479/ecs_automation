| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |
| Resource       | ../../resources/keywords/login_page/login.robot |

| *** Test Cases *** |
| Heading |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-title'] |
|    | ${value} | Set Variable | Meters |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Status |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-status'] |
|    | ${value} | Set Variable | Active |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Meter Number |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-meterNumber-serviceSlot'] |
|    | ${value} | Set Variable | 91623809, Master |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Last Read Date |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-lastRead'] |
|    | ${value} | Set Variable | 8/7/15 4:11 PM |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Reading Type |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-lastRead'] |
|    | ${value} | Set Variable | 1 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Pulled For Reading Date |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-lastRead'] |
|    | ${value} | Set Variable | ?? |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| AMR Read Method |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-readMethod'] |
|    | ${value} | Set Variable | AMR |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Meter Book Name |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-book'] |
|    | ${value} | Set Variable | 17 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Meter Book Description |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-book-description'] |
|    | ${value} | Set Variable | 3700134, Mechanical, ABB |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Meter Book Read Sequence |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-book-readSequence'] |
|    | ${value} | Set Variable | 36 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Meter Book Cycle |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-book-cycle'] |
|    | ${value} | Set Variable | 2 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Manufacturer |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-manufacturer'] |
|    | ${value} | Set Variable | ABB |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Multiplier |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-multiplier'] |
|    | ${value} | Set Variable | 1 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Meter Amps |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-amps'] |
|    | ${value} | Set Variable | 200 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Meter Wires |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-wires'] |
|    | ${value} | Set Variable | 3 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Volts |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-volts'] |
|    | ${value} | Set Variable | 240 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Dials |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-dials'] |
|    | ${value} | Set Variable | 5 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Dial Style |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-dialStyle'] |
|    | ${value} | Set Variable | Cyclomtr |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Class |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-class'] |
|    | ${value} | Set Variable | 200 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| KSubH |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-kSubH'] |
|    | ${value} | Set Variable | 7.2 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Form |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-form'] |
|    | ${value} | Set Variable | 2S AMR CL200 |
|    | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Demand Precision |
|    | Log | Need to Implement! | level=WARN |
|    | Comment | ${element_locator} | Set Variable | jquery=[data-test-id='meters-demandPrecision'] |
|    | Comment | ${value} | Set Variable | Standard |
|    | Comment | kw Verify Node Contains Value | ${element_locator} | ${value} |

| Grid Column Headings |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-container'] .k-grid-header |
|    | @{column_headings} | Create List | Reading Date | Account | Meter | Reading Type | Billed |
|    | ... | Reader | SM | Rate | Input Method | Date Entered | Entered By |
|    | kw Verify Grid Column Headings | ${element_locator} | @{column_headings} |

| Grid Column Reading Date |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-container'] .k-grid-content |
|    | ${value} | Set Variable | October 12, 2015 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Account |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-container'] .k-grid-content |
|    | ${value} | Set Variable | 12345 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Meter |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-container'] .k-grid-content |
|    | ${value} | Set Variable | 67890 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Reading Type |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-container'] .k-grid-content |
|    | ${value} | Set Variable | ReadingType1 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Billed |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-container'] .k-grid-content \ .accent-completed |
|    | kw Wait Until Element Visible | ${element_locator} |

| Grid Column Reader |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-container'] .k-grid-content |
|    | ${value} | Set Variable | Reader 1 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column SM |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-container'] .k-grid-content |
|    | ${value} | Set Variable | 2 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Rate |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-container'] .k-grid-content |
|    | ${value} | Set Variable | RateCode1 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Input Method |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-container'] .k-grid-content |
|    | ${value} | Set Variable | Method1 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Date Entered |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-container'] .k-grid-content |
|    | ${value} | Set Variable | October 19, 2015 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

| Grid Column Entered By |
|    | ${element_locator} | Set Variable | jquery=[data-test-id='meters-container'] .k-grid-content |
|    | ${value} | Set Variable | UserName1 |
|    | kw Verify Grid Contains Value | ${element_locator} | ${value} |

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

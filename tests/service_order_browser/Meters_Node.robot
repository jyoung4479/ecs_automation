| *** Settings *** |
| Suite Setup    | kw Suite Setup |
| Suite Teardown | kw Suite Teardown |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |
| Resource       | ../../resources/keywords/login_page/login.robot |

| *** Test Cases *** |
| Heading |
|    | ${value} | Set Variable | Meters |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-title'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-title'] | ${value} |

| Status |
|    | ${value} | Set Variable | Active |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-status'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-status'] | ${value} |

| Meter Number |
|    | ${value} | Set Variable | 91623809, Master |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-meterNumber-serviceSlot'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-meterNumber-serviceSlot'] | ${value} |

| Last Read Date |
|    | ${value} | Set Variable | 8/7/15 4:11 PM |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-lastRead'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-lastRead'] | ${value} |

| Reading Type |
|    | ${value} | Set Variable | 1 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-lastRead'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-lastRead'] | ${value} |

| Pulled For Reading Date |
|    | ${value} | Set Variable | ?? |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-lastRead'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-lastRead'] | ${value} |

| AMR Read Method |
|    | ${value} | Set Variable | AMR |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-readMethod'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-readMethod'] | ${value} |

| Meter Book Name |
|    | ${value} | Set Variable | 17 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-book'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-book'] | ${value} |

| Meter Book Description |
|    | ${value} | Set Variable | 3700134, Mechanical, ABB |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-book-description'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-book-description'] | ${value} |

| Meter Book Read Sequence |
|    | ${value} | Set Variable | 36 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-book-readSequence'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-book-readSequence'] | ${value} |

| Meter Book Cycle |
|    | ${value} | Set Variable | 2 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-book-cycle'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-book-cycle'] | ${value} |

| Manufacturer |
|    | ${value} | Set Variable | ABB |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-manufacturer'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-manufacturer'] | ${value} |

| Multiplier |
|    | ${value} | Set Variable | 1 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-multiplier'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-multiplier'] | ${value} |

| Meter Amps |
|    | ${value} | Set Variable | 200 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-amps'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-amps'] | ${value} |

| Meter Wires |
|    | ${value} | Set Variable | 3 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-wires'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-wires'] | ${value} |

| Volts |
|    | ${value} | Set Variable | 240 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-volts'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-volts'] | ${value} |

| Dials |
|    | ${value} | Set Variable | 5 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-dials'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-dials'] | ${value} |

| Dial Style |
|    | ${value} | Set Variable | Cyclomtr |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-dialStyle'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-dialStyle'] | ${value} |

| Class |
|    | ${value} | Set Variable | 200 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-class'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-class'] | ${value} |

| KSubH |
|    | ${value} | Set Variable | 7.2 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-kSubH'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-kSubH'] | ${value} |

| Form |
|    | ${value} | Set Variable | 2S AMR CL200 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-form'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-form'] | ${value} |

| Demand Precision |
|    | Log | Need to Implement! | level=WARN |
|    | Comment | ${value} | Set Variable | Standard |
|    | Comment | kw Wait Until Element Visible | jquery=[data-test-id='meters-demandPrecision'] |
|    | Comment | kw Wait Until Element Contains | jquery=[data-test-id='meters-demandPrecision'] | ${value} |

| Grid Column Headings |
|    | @{column_headings} | Create List | Reading Date | Account | Meter | Reading Type | Billed |
|    | ... | Reader | SM | Rate | Input Method | Date Entered | Entered By |
|    | : FOR | ${heading} | IN | @{column_headings} |
|    |    | kw Wait Until Element Visible | jquery=[data-test-id='meters-container'] .k-grid-header |
|    |    | kw Wait Until Element Contains | jquery=[data-test-id='meters-container'] .k-grid-header | ${heading} |

| Grid Column Reading Date |
|    | ${value} | Set Variable | September 26, 2015 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-container'] td:contains('${value}') | ${value} |

| Grid Column Account |
|    | ${value} | Set Variable | 12345 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-container'] td:contains('${value}') | ${value} |

| Grid Column Meter |
|    | ${value} | Set Variable | 67890 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-container'] td:contains('${value}') | ${value} |

| Grid Column Reading Type |
|    | ${value} | Set Variable | ReadingType1 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-container'] td:contains('${value}') | ${value} |

| Grid Column Billed |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-container'] td .accent-completed |

| Grid Column Reader |
|    | ${value} | Set Variable | Reader 1 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-container'] td:contains('${value}') | ${value} |

| Grid Column SM |
|    | ${value} | Set Variable | 2 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-container'] td:contains('${value}') | ${value} |

| Grid Column Rate |
|    | ${value} | Set Variable | RateCode1 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-container'] td:contains('${value}') | ${value} |

| Grid Column Input Method |
|    | ${value} | Set Variable | Method1 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-container'] td:contains('${value}') | ${value} |

| Grid Column Date Entered |
|    | ${value} | Set Variable | October 5, 2015 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-container'] td:contains('${value}') | ${value} |

| Grid Column Entered By |
|    | ${value} | Set Variable | UserName1 |
|    | kw Wait Until Element Visible | jquery=[data-test-id='meters-container'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=[data-test-id='meters-container'] td:contains('${value}') | ${value} |

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

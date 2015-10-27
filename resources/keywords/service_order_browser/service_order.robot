| *** Settings *** |
| Resource       | ../login_page/login.robot |

| *** Keywords *** |
| kw Suite Setup |
|    | kw Open and Maximize Browser |
|    | Set Selenium Speed | 0 s |
|    | Set Browser Implicit Wait | 15 s |
|    | Set Selenium Implicit Wait | 15 s |
|    | Set Selenium Timeout | 15 s |
|    | Set Global Variable | ${var_URL} | http://192.168.1.33:2915 |
|    | Set Global Variable | ${var_SERVICE_ORDER_ID} | 716729 |
|    | kw Login |
|    | kw Go To Service Order | ${var_SERVICE_ORDER_ID} |
|    | kw Hide StickyHeader |

| kw Suite Teardown |
|    | Run Keyword And Ignore Error | Close All Browsers |

| kw Case Teardown |
|    | ${screenshot_filename} | Set Variable | C:\\ecs_automation_screenshots\\${TEST_NAME}-${TEST_STATUS}.png |
|    | Run Keyword If Test Failed | Capture Page Screenshot | filename=${screenshot_filename} |
|    | Run Keyword If Test Failed | kw Log Message | ${screenshot_filename} | level=WARN |

| kw Go To Service Order |
|    | [Arguments] | ${service_order_id} |
|    | kw Log Message | Service Order:\t${var_URL}/serviceorderbrowser/${service_order_id} | level=WARN |
|    | kw Wait Until Page Loads |
|    | kw Click Element | jquery=a:contains('${service_order_id}') |

| kw Verify Grid Column Headings |
|    | [Arguments] | ${grid_locator} | @{column_headings} |
|    | : FOR | ${heading} | IN | @{column_headings} |
|    |    | kw Wait Until Element Visible | ${grid_locator} |
|    |    | kw Wait Until Element Contains | ${grid_locator} | ${heading} |

| kw Verify Grid Contains Value |
|    | [Arguments] | ${grid_locator} | ${value} |
|    | kw Wait Until Element Visible | ${grid_locator} |
|    | kw Wait Until Element Contains | ${grid_locator} | ${value} |

| kw Verify Element Contains Value |
|    | [Arguments] | ${locator} | ${value} |
|    | kw Wait Until Element Visible | ${locator} |
|    | kw Wait Until Element Contains | ${locator} | ${value} |

| kw Change Assigned To Value |
|    | sleep | 1 s |
|    | kw Click Element | jquery=[data-test-id='so-assignedTo'] a |
|    | kw Wait Until Element Visible | jquery=[i18n='serviceorderbrowser.AssignResource'] |
|    | sleep | 1 s |
|    | kw Click Element | jquery=[name='ata.assignAssociate'] span.k-input |
|    | kw Wait Until Page Contains Element | jquery=.k-animation-container li[role='option'] |
|    | ${options} | Get Webelements | jquery=.k-animation-container li[role='option'] |
|    | ${num_options} | Get Length | ${options} |
|    | ${selected_option} | Evaluate | random.randint(0, ${num_options}-1) | random |
|    | ${value} | Get Text | jquery=.k-animation-container li[data-offset-index=${selected_option}] |
|    | Execute Javascript | window.jQuery(".k-animation-container li[data-offset-index=${selected_option}]").click() |
|    | kw Wait Until Element Not Visible | jquery=.k-animation-container |
|    | kw Click Element | jquery=button:contains('APPLY') |
|    | [Return] | ${value} |

| kw Change Activity Center Value |
|    | sleep | 1 s |
|    | kw Click Element | jquery=[data-test-id='so-activityCenter'] a |
|    | kw Wait Until Element Visible | jquery=[i18n='serviceorderbrowser.Route'] |
|    | sleep | 1 s |
|    | kw Click Element | jquery=[name='aac.activityCenter'] span.k-input |
|    | kw Wait Until Page Contains Element | jquery=.k-animation-container li[role='option'] |
|    | ${options} | Get Webelements | jquery=.k-animation-container li[role='option'] |
|    | ${num_options} | Get Length | ${options} |
|    | ${selected_option} | Evaluate | random.randint(0, ${num_options}-1) | random |
|    | ${value} | Get Text | jquery=.k-animation-container li[data-offset-index=${selected_option}] |
|    | Execute Javascript | window.jQuery(".k-animation-container li[data-offset-index=${selected_option}]").click() |
|    | kw Wait Until Element Not Visible | jquery=.k-animation-container |
|    | kw Click Element | jquery=button:contains('APPLY') |
|    | [Return] | ${value} |

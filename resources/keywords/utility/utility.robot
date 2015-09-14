| *** Settings *** |
| Library        | Selenium2Library |
| Library        | ../../lib/helper.py |
| Resource       | ../../variables/global.robot |

| *** Keywords *** |
| kw Log Message |
|    | [Arguments] | ${message} | ${level}=INFO |
|    | Set Log Level | ${level} |
|    | Log | ${message} | level=${level} |
|    | Set Log Level | ${var_LOG_LEVEL} |

| kw Log Keyword Status |
|    | [Arguments] | ${log_level}=INFO |
|    | ${current_keyword} | Catenate | SEPARATOR=${SPACE}->${SPACE} | ${var_DEBUG_KW_TOPLEVEL} | ${var_DEBUG_KW_HIGHLEVEL} | ${var_DEBUG_KW_LOWLEVEL} |
|    | ${status_message} | Catenate | SEPARATOR=\t | Now Running: | ${current_keyword} |
|    | Run Keyword If | '${var_USE_DEBUG_LOGGING}' == 'true' | kw Log Message | ${SPACE} | #adds extra line in output to make it easier to read |
|    | kw Log Message | ${status_message} | ${log_level} |

| kw Log Keyword Failed |
|    | [Arguments] | ${log_level}=WARN |
|    | ${current_keyword} | Catenate | SEPARATOR=${SPACE}->${SPACE} | ${var_DEBUG_KW_TOPLEVEL} | ${var_DEBUG_KW_HIGHLEVEL} | ${var_DEBUG_KW_LOWLEVEL} |
|    | ${failure_message} | Catenate | SEPARATOR=\t | \tKEYWORD FAILED WHILE RUNNING: | ${current_keyword} |
|    | kw Log Message | ${failure_message} | ${log_level} |

| kw Log Test Info |
|    | [Arguments] | ${service_order_id} | ${log_level}=WARN |
|    | ${test_type_message} | Set Variable | Test: ${TEST_NAME} |
|    | ${url_message} | Set Variable | Service Order Url: http://192.168.1.199:2915/serviceorderbrowser/${service_order_id} |
|    | ${service_order_id_message} | Set Variable | Service Order ID: ${service_order_id} |
|    | ${test_info_message} | Catenate | SEPARATOR=\n | ${test_type_message} | ${url_message} | ${service_order_id_message} |
|    | kw Log Message | ${test_info_message} | ${log_level} |

| kw Open Browser To URL |
|    | [Arguments] | ${browser}=chrome | ${url}=http://www.google.com |
|    | ${browserIndex} | Open Browser | ${url} | browser=${browser} |
|    | Run Keyword and Ignore Error | Maximize Browser Window |
|    | [Return] | ${browserIndex} |

| kw Wait For Top Frame To Load |
|    | [Arguments] | ${timeout}=2 min | ${retry_interval}=5 s |
|    | ${window} | Set Variable | ${var_WINDOW_NAME} |
|    | kw Select Window By Name | ${window} |
|    | Unselect Frame |
|    | kw Wait For Ajax |
|    | kw Wait Until Overlay Not Visible |

| kw Wait For Ajax |
|    | [Arguments] | ${timeout}=2 min | ${retry_interval}=5 s |
|    | ${original_failure_keyword} | Register Keyword To Run On Failure | No Operation |
|    | ${current_keyword_message} | Catenate | SEPARATOR=${SPACE}->${SPACE} | ${var_DEBUG_KW_TOPLEVEL} | ${var_DEBUG_KW_HIGHLEVEL} | ${var_DEBUG_KW_LOWLEVEL} |
|    | ${message_tmp} | Catenate | SEPARATOR=\n\t\t\t\t\t\t | ${SPACE} | Failed During Keyword:\t${current_keyword_message} | \tTimed out waiting for no active connections: |
|    | Comment | kw Insert jQuery Into Page As Needed |
|    | Wait Until Keyword Succeeds | ${timeout} | ${retry_interval} | Wait for Condition | return window.jQuery.active == 0; | error=${message_tmp} |
|    | Wait Until Keyword Succeeds | ${timeout} | ${retry_interval} | Wait for Condition | return window.jQuery(':animated').length==0; | error=${message_tmp} |
|    | Register Keyword To Run On Failure | ${original_failure_keyword} |

| kw Wait Until Overlay Not Visible |
|    | [Arguments] | @{overlay_locators} |
|    | ${overlays_on_page} | Execute Javascript | return jQuery("#appStickyHeader").length |
|    | Run Keyword If | ${overlays_on_page} > 0 | Wait Until Element Is Not Visible | jquery=#appStickyHeader |

| kw Wait Until Element Exists |
|    | [Arguments] | ${element} | ${timeout}=2 min | ${retry_interval}=5 s |
|    | ${original_failure_keyword} | Register Keyword To Run On Failure | No Operation |
|    | ${current_url} | Get Location |
|    | ${current_keyword_message} | Catenate | SEPARATOR=${SPACE}->${SPACE} | ${var_DEBUG_KW_TOPLEVEL} | ${var_DEBUG_KW_HIGHLEVEL} | ${var_DEBUG_KW_LOWLEVEL} |
|    | ${element_as_css} | helper.Kw Get Raw Css From String | ${element} |
|    | ${element_as_js} | Catenate | SEPARATOR= | jQuery(" | ${element_as_css} | ") |
|    | Run Keyword If | '${var_USE_DEBUG_LOGGING}' == 'true' | kw Log Message | \t\t\tVerifying Element Exists:\t${element} |
|    | ${message_tmp} | Catenate | SEPARATOR=\n\t\t\t\t\t\t | ${SPACE} | Failed During Keyword:\t${current_keyword_message} | \tThe following element should exist on the page but does not: | \tCurrent Url:\t${current_url} |
|    | ... | \tElement:\t${element} | \tElement as jQuery Selector:\t${element_as_js} |
|    | Wait Until Keyword Succeeds | ${timeout} | ${retry_interval} | Page Should Contain Element | ${element} | message=${message_tmp} |
|    | Register Keyword To Run On Failure | ${original_failure_keyword} |

| kw Wait Until Element Visible |
|    | [Arguments] | ${element} | ${timeout}=2 min | ${retry_interval}=5 s | ${message}= |
|    | ${original_failure_keyword} | Register Keyword To Run On Failure | No Operation |
|    | ${current_url} | Get Location |
|    | ${current_keyword_message} | Catenate | SEPARATOR=${SPACE}->${SPACE} | ${var_DEBUG_KW_TOPLEVEL} | ${var_DEBUG_KW_HIGHLEVEL} | ${var_DEBUG_KW_LOWLEVEL} |
|    | ${element_as_css} | helper.Kw Get Raw Css From String | ${element} |
|    | ${element_as_js} | Catenate | SEPARATOR= | jQuery(" | ${element_as_css} | ") |
|    | Run Keyword If | '${var_USE_DEBUG_LOGGING}' == 'true' | kw Log Message | \t\t\tVerifying Element Visible:\t${element} |
|    | ${message_tmp} | Catenate | SEPARATOR=\n\t\t\t\t\t\t | ${SPACE} | Failed During Keyword:\t${current_keyword_message} | \tThe following element should be visible but is not: | \tCurrent Url:\t${current_url} |
|    | ... | \tElement:\t${element} | \tElement as jQuery Selector:\t${element_as_js} |
|    | Wait Until Keyword Succeeds | ${timeout} | ${retry_interval} | Element Should Be Visible | ${element} | message=${message_tmp} |
|    | Register Keyword To Run On Failure | ${original_failure_keyword} |

| kw Wait Until Element Not Visible |
|    | [Arguments] | ${element} | ${timeout}=2 min | ${retry_interval}=5 s |
|    | ${original_failure_keyword} | Register Keyword To Run On Failure | No Operation |
|    | ${current_url} | Get Location |
|    | ${current_keyword_message} | Catenate | SEPARATOR=${SPACE}->${SPACE} | ${var_DEBUG_KW_TOPLEVEL} | ${var_DEBUG_KW_HIGHLEVEL} | ${var_DEBUG_KW_LOWLEVEL} |
|    | ${element_as_css} | helper.Kw Get Raw Css From String | ${element} |
|    | ${element_as_js} | Catenate | SEPARATOR= | jQuery(" | ${element_as_css} | ") |
|    | Run Keyword If | '${var_USE_DEBUG_LOGGING}' == 'true' | kw Log Message | \t\t\tVerifying Element NOT Visible:\t${element} |
|    | ${message_tmp} | Catenate | SEPARATOR=\n\t\t\t\t\t\t | ${SPACE} | Failed During Keyword:\t${current_keyword_message} | \tThe following element should NOT be visible but it is: | \tCurrent Url:\t${current_url} |
|    | ... | \tElement:\t${element} | \tElement as jQuery Selector:\t${element_as_js} |
|    | Wait Until Keyword Succeeds | ${timeout} | ${retry_interval} | Element Should Not Be Visible | ${element} | message=${message_tmp} |
|    | Register Keyword To Run On Failure | ${original_failure_keyword} |

| kw Wait Until Element Contains |
|    | [Arguments] | ${element} | ${text} | ${timeout}=2 min | ${retry_interval}=5 s |
|    | ${original_failure_keyword} | Register Keyword To Run On Failure | No Operation |
|    | ${current_url} | Get Location |
|    | ${current_keyword_message} | Catenate | SEPARATOR=${SPACE}->${SPACE} | ${var_DEBUG_KW_TOPLEVEL} | ${var_DEBUG_KW_HIGHLEVEL} | ${var_DEBUG_KW_LOWLEVEL} |
|    | ${element_as_css} | helper.Kw Get Raw Css From String | ${element} |
|    | ${element_as_js} | Catenate | SEPARATOR= | jQuery(" | ${element_as_css} | ") |
|    | ${element_text} | Get Text | ${element} |
|    | Run Keyword If | '${var_USE_DEBUG_LOGGING}' == 'true' | kw Log Message | \t\t\tVerifying Element Contains Text '${text}':\t${element} |
|    | ${message_tmp} | Catenate | SEPARATOR=\n\t\t\t\t\t\t | ${SPACE} | Failed During Keyword:\t${current_keyword_message} | \tThe following element does not contain the text specified: | \tCurrent Url:\t${current_url} |
|    | ... | \tElement:\t${element} | \tElement as jQuery Selector:\t${element_as_js} | \tText Should be:\t${text}\t\tText Found in Element:\t${element_text} |
|    | ${passed} | Run Keyword And Return Status | Wait Until Keyword Succeeds | ${timeout} | ${retry_interval} | Element Should Contain | ${element} |
|    | ... | ${text} | message=${message_tmp} |
|    | Register Keyword To Run On Failure | ${original_failure_keyword} |

| kw Set Current Window Name |
|    | ${randomInteger} | Evaluate | random.randint(0,100) | random |
|    | ${randomWindowName} | Catenate | SEPARATOR= | window | ${randomInteger} |
|    | Set Global Variable | ${var_WINDOW_NAME} | ${randomWindowName} |
|    | Execute Javascript | window.name="${randomWindowName}" |
|    | [Return] | ${randomWindowName} |

| kw Select Window By Name |
|    | [Arguments] | ${windowName} |
|    | Select Window | ${windowName} |

| kw Insert jQuery Into Page As Needed |
|    | ${flag} | kw Check Page For jQuery |
|    | Run Keyword If | ${flag} | Execute Javascript | var jq = document.createElement('script');jq.src = '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js';document.getElementsByTagName('head')[0].appendChild(jq); |
|    | Wait Until Keyword Succeeds | 20 s | 1s | kw Check Page For jQuery |
|    | Run Keyword If | ${flag} | kw Log Message | jQuery not found on page. \ \tInserting jQuery! | level=WARN |

| kw Check Page For jQuery |
|    | ${flag_tmp} | Execute Javascript | return typeof jQuery == 'undefined' |
|    | [Return] | ${flag_tmp} |

| kw Click Element |
|    | [Arguments] | ${element} |
|    | Log | Clicking Element:\tElement: ${element} | DEBUG |
|    | Run Keyword If | '${var_USE_DEBUG_LOGGING}' == 'true' | kw Log Message | \t\t\tClicking Element:\t\t${element} |
|    | Click Element | ${element} |

| kw Input Text |
|    | [Arguments] | ${element} | ${text} |
|    | Log | Inputting Text:\tElement: ${element} | DEBUG |
|    | Run Keyword If | '${var_USE_DEBUG_LOGGING}' == 'true' | kw Log Message | \t\t\tInputting Text:\t\t\t${element} |
|    | Input Text | ${element} | ${text} |

| kw Verify Element Text |
|    | [Arguments] | ${element} | ${actual} | ${expected} |
|    | ${original_failure_keyword} | Register Keyword To Run On Failure | No Operation |
|    | ${current_url} | Get Location |
|    | ${current_keyword_message} | Catenate | SEPARATOR=${SPACE}->${SPACE} | ${var_DEBUG_KW_TOPLEVEL} | ${var_DEBUG_KW_HIGHLEVEL} | ${var_DEBUG_KW_LOWLEVEL} |
|    | ${element_as_css} | helper.Kw Get Raw Css From String | ${element} |
|    | ${element_as_js} | Catenate | SEPARATOR= | jQuery(" | ${element_as_css} | ") |
|    | Run Keyword If | '${var_USE_DEBUG_LOGGING}' == 'true' | kw Log Message | \t\t\tVerifying Element Text as Substring:\t${element} |
|    | ${message_tmp} | Catenate | SEPARATOR=\n\t\t\t\t\t\t | ${SPACE} | Failed During Keyword:\t${current_keyword_message} | \tThe following element has unexpected text: | \tCurrent Url:\t${current_url} |
|    | ... | \tElement as jQuery:\t${element_as_js} | \tElement:\t${element} | \tElement Text/Value Found: ${actual} | \tElement Substring Expected: ${expected} |
|    | Should Contain | ${actual} | ${expected} | ${message_tmp} |

| kw Verify Element Value |
|    | [Arguments] | ${element} | ${actual} | ${expected} |
|    | ${original_failure_keyword} | Register Keyword To Run On Failure | No Operation |
|    | ${current_url} | Get Location |
|    | ${current_keyword_message} | Catenate | SEPARATOR=${SPACE}->${SPACE} | ${var_DEBUG_KW_TOPLEVEL} | ${var_DEBUG_KW_HIGHLEVEL} | ${var_DEBUG_KW_LOWLEVEL} |
|    | ${element_as_css} | helper.Kw Get Raw Css From String | ${element} |
|    | ${element_as_js} | Catenate | SEPARATOR= | jQuery(" | ${element_as_css} | ") |
|    | Run Keyword If | '${var_USE_DEBUG_LOGGING}' == 'true' | kw Log Message | \t\t\tVerifying Element Value:\t${element} |
|    | ${message_tmp} | Catenate | SEPARATOR=\n\t\t\t\t\t\t | ${SPACE} | Failed During Keyword:\t${current_keyword_message} | \tThe following element has an unexpected value: | \tCurrent Url:\t${current_url} |
|    | ... | \tElement as jQuery:\t${element_as_js} | \tElement:\t${element} | \tElement Value Found: ${actual} | \tElement Value Expected: ${expected} |
|    | Should Be True | '${actual}' == '${expected}' | ${message_tmp} |

| kw Hide StickyHeader |
|    | [Arguments] | ${timeout}=2 min | ${retry_interval}=5 s |
|    | kw Wait For Top Frame To Load |
|    | Execute Javascript | window.jQuery("#appStickyHeader").hide() |
|    | kw Wait Until Element Not Visible | jquery=#appStickyHeader |

| kw Show StickyHeader |
|    | [Arguments] | ${timeout}=2 min | ${retry_interval}=5 s |
|    | kw Wait For Top Frame To Load |
|    | Execute Javascript | window.jQuery("#appStickyHeader").show() |
|    | kw Wait Until Element Visible | jquery=#appStickyHeader |

| kw Case Teardown |
|    | [Arguments] | ${log_level}=WARN |
|    | Comment | Set Log Level | ${log_level} |
|    | Comment | ${message_tmp} | Catenate | SEPARATOR=${SPACE}->${SPACE} | ${var_DEBUG_KW_TOPLEVEL} | ${var_DEBUG_KW_HIGHLEVEL} | ${var_DEBUG_KW_LOWLEVEL} |
|    | Comment | Run Keyword If Test Failed | kw Log Message | ----------> KEYWORD RUNNING WHEN FAILURE OCCURED ----------> \t${message_tmp} | ${log_level} |
|    | Comment | ${screenshot_filename} | Catenate | SEPARATOR=_ | ${SUITE_NAME} | ${TEST_NAME} | ${TEST_STATUS} |
|    | Comment | Run Keyword If Test Failed | Capture Page Screenshot | ${screenshot_filename}.png |
|    | Comment | Run Keyword If Test Failed | kw Log Message | ----------> SCREENSHOT OF FAILURE ----------> \ ${OUTPUT_DIR}\\${screenshot_filename}.png | ${log_level} |
|    | Comment | kw Log Message | ====>\t${TEST_NAME}\t->\t${TEST_STATUS}\t<==== | ${log_level} |
|    | Comment | kw Log Message | ============================================ | ${log_level} |
|    | Run Keyword And Continue On Failure | Close All Browsers |

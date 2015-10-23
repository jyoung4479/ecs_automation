| *** Settings *** |
| Library        | Selenium2Library |
| Library        | ../../lib/helper.py |
| Resource       | ../../variables/global.robot |

| *** Keywords *** |
| kw Log Message |
|    | [Arguments] | ${message} | ${element_locator}='' | ${value}=${SPACE} | ${level}=INFO |
|    | ${log_message} | Catenate | SEPARATOR=\t | ${message} | ${element_locator} | ${value} |
|    | Log | ${log_message} | level=${level} |

| kw Open and Maximize Browser |
|    | [Arguments] | ${browser}=chrome | ${url}=http://www.google.com |
|    | ${browserIndex} | Open Browser | ${url} | ${browser} |
|    | Run Keyword and Ignore Error | Maximize Browser Window |
|    | ${window_name} | kw Set Current Window Name |
|    | Set Global Variable | ${var_WINDOW_NAME} | ${window_name} |
|    | [Return] | ${browserIndex} |

| kw Go To URL |
|    | [Arguments] | ${url}=http://www.google.com |
|    | Go To | ${url} |

| kw Wait Until Page Loads |
|    | [Arguments] | ${timeout}=10 s | ${retry_interval}=2 s |
|    | Select Window |
|    | Set Global Variable | ${var_ERROR_MESSAGE} | Failed while waiting for window.jQuery.active == 0 |
|    | Wait Until Keyword Succeeds | ${timeout} | ${retry_interval} | Wait for Condition | return window.jQuery.active == 0; | ${timeout} | ${var_ERROR_MESSAGE} |
|    | Set Global Variable | ${var_ERROR_MESSAGE} | Failed while waiting for window.jQuery(':animated').length==0; |
|    | Wait Until Keyword Succeeds | ${timeout} | ${retry_interval} | Wait for Condition | return window.jQuery(':animated').length==0; | ${timeout} | ${var_ERROR_MESSAGE} |

| kw Wait Until Page Contains |
|    | [Arguments] | ${value} | ${timeout}=15 s | ${retry_interval}=5 s |
|    | kw Log Message | Wait Until Page Contains Text: | ${SPACE} | ${value} | level=WARN |
|    | kw Wait Until Page Loads |
|    | Set Global Variable | ${var_ERROR_MESSAGE} | Failed while waiting for page to contain text:\t{value} |
|    | Wait Until Page Contains | ${value} | ${timeout} | ${var_ERROR_MESSAGE} |

| kw Wait Until Page Contains Element |
|    | [Arguments] | ${element_locator} | ${timeout}=15 s | ${retry_interval}=5 s |
|    | kw Log Message | Wait Until Page Contains Element: | ${element_locator} | ${SPACE} | level=WARN |
|    | kw Wait Until Page Loads |
|    | Set Global Variable | ${var_ERROR_MESSAGE} | Failed while waiting for page to contain element:\t${element} |
|    | Wait Until Page Contains Element | ${element_locator} | ${timeout} | ${var_ERROR_MESSAGE} |

| kw Wait Until Page Does Not Contain Element |
|    | [Arguments] | ${element_locator} | ${timeout}=15 s | ${retry_interval}=5 s |
|    | kw Log Message | Wait Until Page Does Not Contain Element: | ${element_locator} | level=WARN |
|    | kw Wait Until Page Loads |
|    | Set Global Variable | ${var_ERROR_MESSAGE} | Failed while waiting for page to not contain element:\t${element_locator} |
|    | Wait Until Page Does Not Contain Element | ${element_locator} | ${timeout} | ${var_ERROR_MESSAGE} |

| kw Wait Until Element Visible |
|    | [Arguments] | ${element_locator} | ${timeout}=15 s | ${retry_interval}=5 s |
|    | kw Log Message | Wait Until Element Is Visible: | ${element_locator} | level=WARN |
|    | kw Wait Until Page Loads |
|    | Set Global Variable | ${var_ERROR_MESSAGE} | Failed while waiting for element to be visible:\t${element_locator} |
|    | Wait Until Element Is Visible | ${element_locator} | ${timeout} | ${var_ERROR_MESSAGE} |

| kw Wait Until Element Not Visible |
|    | [Arguments] | ${element_locator} | ${timeout}=15 s | ${retry_interval}=5 s |
|    | kw Log Message | Wait Until Element Is Not Visible: | ${element_locator} | level=WARN |
|    | kw Wait Until Page Loads |
|    | Set Global Variable | ${var_ERROR_MESSAGE} | Failed while waiting for element to not be visiblet:\t${element_locator} |
|    | Wait Until Element Is Not Visible | ${element_locator} | ${timeout} | ${var_ERROR_MESSAGE} |

| kw Wait Until Element Contains |
|    | [Arguments] | ${element_locator} | ${value} | ${timeout}=15 s | ${retry_interval}=5 s |
|    | kw Log Message | Wait Until Element Contains Text: | ${element_locator} | ${value} | level=WARN |
|    | kw Wait Until Page Loads |
|    | ${actual_text_from_element} | Get Text | ${element_locator} |
|    | Set Global Variable | ${var_ERROR_MESSAGE} | Failed while waiting for element to contain text:\t${element_locator}\n\tExpected:\t${value}\n\tActual:\t${actual_text_from_element} |
|    | Wait Until Element Contains | ${element_locator} | ${value} | ${timeout} | ${var_ERROR_MESSAGE} |

| kw Wait Until Element Does Not Contain |
|    | [Arguments] | ${element_locator} | ${value} | ${timeout}=15 s | ${retry_interval}=5 s |
|    | kw Log Message | Wait Until Element Does Not Contain Text: | ${element_locator} | ${value} | level=WARN |
|    | kw Wait Until Page Loads |
|    | Set Global Variable | ${var_ERROR_MESSAGE} | Failed while waiting for element to not contain text:\t${element_locator}\t${value} |
|    | Wait Until Element Contains | ${element_locator} | ${value} | ${timeout} | ${var_ERROR_MESSAGE} |

| kw Wait Until Element Enabled |
|    | [Arguments] | ${element_locator} | ${timeout}=15 s | ${retry_interval}=5 s |
|    | kw Log Message | Wait Until Element Is Enabled: | ${element_locator} | level=WARN |
|    | kw Wait Until Page Loads |
|    | Set Global Variable | ${var_ERROR_MESSAGE} | Failed while waiting for element to be enabled:\t${element_locator} |
|    | Wait Until Element Is Enabled | ${element_locator} | ${timeout} | ${var_ERROR_MESSAGE} |

| kw Click Element |
|    | [Arguments] | ${element_locator} |
|    | kw Log Message | Click Element: | ${element_locator} | level=WARN |
|    | kw Wait Until Page Loads |
|    | kw Wait Until Element Visible | ${element_locator} |
|    | Click Element | ${element_locator} |

| kw Input Text |
|    | [Arguments] | ${element_locator} | ${value} |
|    | kw Log Message | Input Text Into Element: | ${element_locator} | ${value} | level=WARN |
|    | kw Wait Until Page Loads |
|    | kw Wait Until Element Visible | ${element_locator} |
|    | Input Text | ${element_locator} | ${value} |

| kw Set Current Window Name |
|    | ${random_int} | Evaluate | random.randint(0,100) | random |
|    | ${random_window_name} | Catenate | SEPARATOR= | window | ${random_int} |
|    | Execute Javascript | window.name="${random_window_name}" |
|    | Get Window Names |
|    | [Return] | ${random_window_name} |

| kw Insert jQuery Into Page As Needed |
|    | ${flag} | kw Check Page For jQuery |
|    | Run Keyword If | ${flag} | Execute Javascript | var jq = document.createElement('script');jq.src = '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js';document.getElementsByTagName('head')[0].appendChild(jq); |
|    | Wait Until Keyword Succeeds | 20 s | 1s | kw Check Page For jQuery |
|    | Run Keyword If | ${flag} | kw Log Message | jQuery not found on page. \ \tInserting jQuery! | level=WARN |

| kw Check Page For jQuery |
|    | ${flag_tmp} | Execute Javascript | return typeof jQuery == 'undefined' |
|    | [Return] | ${flag_tmp} |

| kw Hide StickyHeader |
|    | [Arguments] | ${timeout}=2 min | ${retry_interval}=5 s |
|    | Execute Javascript | window.jQuery("#appStickyHeader").hide() |
|    | kw Wait Until Element Not Visible | jquery=#appStickyHeader |

| kw Show StickyHeader |
|    | [Arguments] | ${timeout}=2 min | ${retry_interval}=5 s |
|    | kw Wait Until Page Loads |
|    | Execute Javascript | window.jQuery("#appStickyHeader").show() |
|    | kw Wait Until Element Visible | jquery=#appStickyHeader |

| *** Settings *** |
| Suite Setup    | kw Open Browser and Login | ${var_BROWSER} | ${var_URL} | ${var_USERNAME} | ${var_PASSWORD} |
| Suite Teardown | kw Case Teardown | ${var_LOG_LEVEL} |
| Test Setup     | kw Go To Service Order | ${var_SERVICE_ORDER_ID} |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |
| Resource       | ../../resources/keywords/login_page/login.robot |

| *** Test Cases *** |
| Tasks Heading |
|    | Set Global Variable | ${var_DEBUG_KW_TOPLEVEL} | Service Order Browser |
|    | Set Global Variable | ${var_DEBUG_KW_HIGHLEVEL} | Tasks Node |
|    | kw Verify Tasks Heading | Tasks |

| Tasks Grid Column Headings |
|    | Set Global Variable | ${var_DEBUG_KW_TOPLEVEL} | Service Order Browser |
|    | Set Global Variable | ${var_DEBUG_KW_HIGHLEVEL} | Tasks Node |
|    | kw Verify Grid Column Headings |

| Task Name |
|    | Set Global Variable | ${var_DEBUG_KW_TOPLEVEL} | Service Order Browser |
|    | Set Global Variable | ${var_DEBUG_KW_HIGHLEVEL} | Tasks Node |
|    | kw Verify Task Name | ServiceOrder Task 1 |

| Task Note |
|    | Set Global Variable | ${var_DEBUG_KW_TOPLEVEL} | Service Order Browser |
|    | Set Global Variable | ${var_DEBUG_KW_HIGHLEVEL} | Tasks Node |
|    | kw Verify Task Note | This is Service Order Task Note |

| Task Completion Date |
|    | Set Global Variable | ${var_DEBUG_KW_TOPLEVEL} | Service Order Browser |
|    | Set Global Variable | ${var_DEBUG_KW_HIGHLEVEL} | Tasks Node |
|    | kw Verify Task Completion Date | October 30, 2015 |

| Task Scheduled Date |
|    | Set Global Variable | ${var_DEBUG_KW_TOPLEVEL} | Service Order Browser |
|    | Set Global Variable | ${var_DEBUG_KW_HIGHLEVEL} | Tasks Node |
|    | kw Verify Task Scheduled Date | August 7, 2015 |

| *** Settings *** |
| Test Setup     | kw Case Setup - Open Browser | ${var_BROWSER} | ${var_LOG_LEVEL} |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/service_order_browser/service_order.robot |
| Resource       | ../../resources/keywords/login_page/login.robot |

| *** Test Cases *** |
| Tasks Heading |
|    | Set Test Variable | ${var_DEBUG_KW_TOPLEVEL} | Tasks Heading |
|    | kw Log Test Info | ${var_SERVICE_ORDER_ID} |
|    | kw Login | ${var_USERNAME} | ${var_PASSWORD} |
|    | kw Go To Service Order | ${var_SERVICE_ORDER_ID} |
|    | kw Verify Tasks Heading | Tasks |

| Tasks Grid Column Headings |
|    | Set Test Variable | ${var_DEBUG_KW_TOPLEVEL} | Tasks Grid Column Headings |
|    | kw Log Test Info | ${var_SERVICE_ORDER_ID} |
|    | kw Login | ${var_USERNAME} | ${var_PASSWORD} |
|    | kw Go To Service Order | ${var_SERVICE_ORDER_ID} |
|    | kw Verify Grid Column Headings |

| Task Name |
|    | Set Test Variable | ${var_DEBUG_KW_TOPLEVEL} | Task Name |
|    | kw Log Test Info | ${var_SERVICE_ORDER_ID} |
|    | kw Login | ${var_USERNAME} | ${var_PASSWORD} |
|    | kw Go To Service Order | ${var_SERVICE_ORDER_ID} |
|    | kw Verify Task Name | ServiceOrder Task 1 |

| Task Note |
|    | Set Test Variable | ${var_DEBUG_KW_TOPLEVEL} | Task Note |
|    | kw Log Test Info | ${var_SERVICE_ORDER_ID} |
|    | kw Login | ${var_USERNAME} | ${var_PASSWORD} |
|    | kw Go To Service Order | ${var_SERVICE_ORDER_ID} |
|    | kw Verify Task Note | This is Service Order Task Note |

| Task Completion Date |
|    | Set Test Variable | ${var_DEBUG_KW_TOPLEVEL} | Task Completion Date |
|    | kw Log Test Info | ${var_SERVICE_ORDER_ID} |
|    | kw Login | ${var_USERNAME} | ${var_PASSWORD} |
|    | kw Go To Service Order | ${var_SERVICE_ORDER_ID} |
|    | kw Verify Task Completion Date | October 30, 2015 |

| Task Scheduled Date |
|    | Set Test Variable | ${var_DEBUG_KW_TOPLEVEL} | Task Scheduled Date |
|    | kw Log Test Info | ${var_SERVICE_ORDER_ID} |
|    | kw Login | ${var_USERNAME} | ${var_PASSWORD} |
|    | kw Go To Service Order | ${var_SERVICE_ORDER_ID} |
|    | kw Verify Task Scheduled Date | August 7, 2015 |

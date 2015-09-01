| *** Settings *** |
| Test Setup     | kw Case Setup |
| Test Teardown  | kw Case Teardown |
| Resource       | ../../resources/keywords/2 High_Level/Service Order.robot |
| Resource       | ../../resources/keywords/2 High_Level/Login Page.robot |
| Resource       | ../../resources/keywords/2 High_Level/tasks.robot |

| *** Test Cases *** |
| Tasks Heading |
|    | Set Test Variable | ${var_DEBUG_KW_TOPLEVEL} | Tasks Heading |
|    | kw Log Test Info | ${var_SERVICE_ORDER_ID} |
|    | kw Login | ${var_USERNAME} | ${var_PASSWORD} |
|    | kw Go To Service Order | ${var_SERVICE_ORDER_ID} |
|    | kw Verify Tasks Heading |

| Tasks Grid Column Headings |
|    | Set Test Variable | ${var_DEBUG_KW_TOPLEVEL} | Tasks Grid Column Headings |
|    | kw Log Test Info | ${var_SERVICE_ORDER_ID} |
|    | kw Login | ${var_USERNAME} | ${var_PASSWORD} |
|    | kw Verify Grid Column Headings |

| Task Name |
|    | Set Test Variable | ${var_DEBUG_KW_TOPLEVEL} | Task Name |
|    | kw Log Test Info | ${var_SERVICE_ORDER_ID} |
|    | kw Login | ${var_USERNAME} | ${var_PASSWORD} |
|    | kw Verify Task Name | ServiceOrder Task 1 |

| Task Note |
|    | Set Test Variable | ${var_DEBUG_KW_TOPLEVEL} | Task Note |
|    | kw Log Test Info | ${var_SERVICE_ORDER_ID} |
|    | kw Login | ${var_USERNAME} | ${var_PASSWORD} |
|    | kw Verify Task Note | This is Service Order Task 1 Notes |

| Task Completion Date |
|    | Set Test Variable | ${var_DEBUG_KW_TOPLEVEL} | Task Completion Date |
|    | kw Log Test Info | ${var_SERVICE_ORDER_ID} |
|    | kw Login | ${var_USERNAME} | ${var_PASSWORD} |
|    | kw Verify Task Completion Date | 2/26/16 |

| Task Scheduled Date |
|    | Set Test Variable | ${var_DEBUG_KW_TOPLEVEL} | Task Scheduled Date |
|    | kw Log Test Info | ${var_SERVICE_ORDER_ID} |
|    | kw Login | ${var_USERNAME} | ${var_PASSWORD} |
|    | kw Verify Task Scheduled Date | 8/7/15 |

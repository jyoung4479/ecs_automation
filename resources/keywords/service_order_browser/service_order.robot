| *** Settings *** |
| Resource       | ../utility/utility.robot |

| *** Keywords *** |
| kw Go To Service Order |
|    | [Arguments] | ${service_order_id} |
|    | kw Wait Until Page Loads |
|    | kw Go To URL | ${var_URL}/serviceorderbrowser/${service_order_id} |

| kw Verify Tasks Heading |
|    | [Arguments] | ${value} |

| kw Verify Tasks Grid Column Headings |

| kw Verify Task Name |
|    | [Arguments] | ${value} |

| kw Verify Task Note |
|    | [Arguments] | ${value} |

| kw Verify Task Completion Date |
|    | [Arguments] | ${value} |
|    | kw Wait Until Element Visible | jquery=div[scroll-target='AppNode4'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=div[scroll-target='AppNode4'] td:contains('${value}') | ${value} |

| kw Verify Task Scheduled Date |
|    | [Arguments] | ${value} |

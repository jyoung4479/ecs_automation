| *** Settings *** |
| Resource       | ../utility/utility.robot |

| *** Keywords *** |
| kw Go To Service Order |
|    | [Arguments] | ${service_order_id} |
|    | kw Log Message | Service Order:\t${var_URL}/serviceorderbrowser/${service_order_id} | level=WARN |
|    | kw Wait Until Page Loads |
|    | kw Go To URL | ${var_URL}/serviceorderbrowser/${service_order_id} |

| kw Verify Grid Column Headings |
|    | [Arguments] | ${grid_locator} | @{column_headings} |
|    | : FOR | ${heading} | IN | @{column_headings} |
|    |    | kw Log Message | Verifying Grid Column Headings:\t ${grid_locator} \t ${heading} |
|    |    | kw Wait Until Element Visible | ${grid_locator} |
|    |    | kw Wait Until Element Contains | ${grid_locator} | ${heading} |

| kw Verify Grid Contains Value |
|    | [Arguments] | ${grid_locator} | ${value} |
|    | kw Log Message | Verifying Grid Contains Text:\t\t ${grid_locator} \t ${value} | level=WARN |
|    | kw Wait Until Element Visible | ${grid_locator} |
|    | kw Wait Until Element Contains | ${grid_locator} | ${value} |

| kw Verify Node Contains Value |
|    | [Arguments] | ${locator} | ${value} |
|    | kw Log Message | Verifying Node Contains Text:\t\t ${locator} \t ${value} | level=WARN |
|    | kw Wait Until Element Visible | ${locator} |
|    | kw Wait Until Element Contains | ${locator} | ${value} |

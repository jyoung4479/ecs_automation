| *** Settings *** |
| Resource       | ../4 Utility/main.robot |

| *** Keywords *** |
| kw Go To Service Order |
|    | [Arguments] | ${service_order_id} |
|    | Set Test Variable | ${var_DEBUG_KW_HIGHLEVEL} | Go To Service Order |
|    | kw Log Keyword Status |
|    | kw Wait For Top Frame To Load |
|    | ${element} | Catenate | SEPARATOR= | jquery=a:contains(' | ${service_order_id} | ') |
|    | kw Wait Until Element Visible | ${element} |
|    | kw Click Element | ${element} |

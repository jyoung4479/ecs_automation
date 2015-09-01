| *** Settings *** |
| Resource       | ../3 Low_Level/login.robot |

| *** Keywords *** |
| kw Login |
|    | [Arguments] | ${username} | ${password} |
|    | Set Test Variable | ${var_DEBUG_KW_HIGHLEVEL} | Login |
|    | kw Log Keyword Status |
|    | Go To | http://192.168.1.199:2915 |
|    | kw Enter Username | ${var_USERNAME} |
|    | kw Enter Password | ${var_PASSWORD} |

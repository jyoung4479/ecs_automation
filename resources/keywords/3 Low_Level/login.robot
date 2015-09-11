| *** Settings *** |
| Resource       | ../4 Utility/main.robot |

| *** Keywords *** |
| kw Enter Username |
|    | [Arguments] | ${username} |
|    | Set Test Variable | ${var_DEBUG_KW_LOWLEVEL} | Enter Username |
|    | kw Log Keyword Status |
|    | kw Wait For Top Frame To Load |
|    | ${element} | Set Variable | jquery=input[name='username'] |
|    | kw Wait Until Element Visible | ${element} |
|    | kw Input Text | ${element} | ${username} |

| kw Enter Password |
|    | [Arguments] | ${password} |
|    | Set Test Variable | ${var_DEBUG_KW_LOWLEVEL} | Enter Password |
|    | kw Log Keyword Status |
|    | kw Wait For Top Frame To Load |
|    | ${element} | Set Variable | jquery=input[name='password'] |
|    | kw Wait Until Element Visible | ${element} |
|    | kw Input Text | ${element} | ${password} |

| kw Click Login Button |
|    | Set Test Variable | ${var_DEBUG_KW_LOWLEVEL} | Click Login Button |
|    | kw Log Keyword Status |
|    | kw Wait For Top Frame To Load |
|    | ${element} | Set Variable | jquery=button[type='submit'] |
|    | kw Wait Until Element Visible | ${element} |
|    | kw Click Element | ${element} |

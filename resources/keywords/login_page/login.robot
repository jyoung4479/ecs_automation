| *** Settings *** |
| Resource       | ../utility/utility.robot |

| *** Keywords *** |
| kw Open Browser and Login |
|    | [Arguments] | ${browser} | ${url} | ${username} | ${password} |
|    | kw Open Browser To URL | ${browser} | ${url} |
|    | Comment | Register Keyword To Run On Failure | kw Log Keyword Failed |
|    | Set Log Level | ${var_LOG_LEVEL} |
|    | Set Global Variable | ${var_DEBUG_KW_TOPLEVEL} | Suite Setup |
|    | Set Global Variable | ${var_DEBUG_KW_HIGHLEVEL} | Open Browser and Login |
|    | Set Selenium Speed | 0 s |
|    | Set Browser Implicit Wait | 120 s |
|    | Set Selenium Implicit Wait | 120 s |
|    | Set Selenium Timeout | 120 s |
|    | kw Log Message | ============================================ | ${var_LOG_LEVEL} |
|    | kw Enter Username | ${username} |
|    | kw Enter Password | ${password} |
|    | kw Click Login Button |

| kw Enter Username |
|    | [Arguments] | ${username} |
|    | Set Global Variable | ${var_DEBUG_KW_LOWLEVEL} | Enter Username |
|    | kw Wait For Top Frame To Load |
|    | ${element} | Set Variable | jquery=input[name='username'] |
|    | kw Wait Until Element Visible | ${element} |
|    | kw Input Text | ${element} | ${username} |

| kw Enter Password |
|    | [Arguments] | ${password} |
|    | Set Global Variable | ${var_DEBUG_KW_LOWLEVEL} | Enter Password |
|    | kw Wait For Top Frame To Load |
|    | ${element} | Set Variable | jquery=input[name='password'] |
|    | kw Wait Until Element Visible | ${element} |
|    | kw Input Text | ${element} | ${password} |

| kw Click Login Button |
|    | Set Global Variable | ${var_DEBUG_KW_LOWLEVEL} | Click Login Button |
|    | kw Wait For Top Frame To Load |
|    | ${element} | Set Variable | jquery=button[type='submit'] |
|    | kw Wait Until Element Visible | ${element} |
|    | kw Click Element | ${element} |

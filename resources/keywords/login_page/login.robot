| *** Settings *** |
| Resource       | ../utility/utility.robot |

| *** Keywords *** |
| kw Login |
|    | [Arguments] | ${url} | ${username} | ${password} |
|    | kw Go To Login Page | ${url} |
|    | kw Enter Username | ${username} |
|    | kw Enter Password | ${password} |
|    | kw Click Login Button |
|    | kw Wait Until Element Visible | jquery=a:contains('${var_SERVICE_ORDER_ID}') |

| kw Go To Login Page |
|    | [Arguments] | ${url} |
|    | kw Go To URL | ${url} |

| kw Enter Username |
|    | [Arguments] | ${username} |
|    | ${element} | Set Variable | jquery=input[name='username'] |
|    | kw Wait Until Element Visible | ${element} |
|    | kw Input Text | ${element} | ${username} |

| kw Enter Password |
|    | [Arguments] | ${password} |
|    | ${element} | Set Variable | jquery=input[name='password'] |
|    | kw Wait Until Element Visible | ${element} |
|    | kw Input Text | ${element} | ${password} |

| kw Click Login Button |
|    | ${element} | Set Variable | jquery=button:contains('Login') |
|    | kw Wait Until Element Visible | ${element} |
|    | kw Click Element | ${element} |

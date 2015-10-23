| *** Settings *** |
| Resource       | ../utility/utility.robot |

| *** Keywords *** |
| kw Login |
|    | kw Go To Login Page |
|    | kw Enter Username |
|    | kw Enter Password |
|    | kw Click Login Button |
|    | kw Wait Until Element Visible | jquery=a:contains('${var_SERVICE_ORDER_ID}') |

| kw Go To Login Page |
|    | kw Go To URL | ${var_URL} |

| kw Enter Username |
|    | ${element_locator} | Set Variable | jquery=input[name='username'] |
|    | kw Wait Until Element Visible | ${element_locator} |
|    | kw Input Text | ${element_locator} | ${var_USERNAME} |

| kw Enter Password |
|    | ${element_locator} | Set Variable | jquery=input[name='password'] |
|    | kw Input Text | ${element_locator} | ${var_PASSWORD} |

| kw Click Login Button |
|    | ${element} | Set Variable | jquery=button:contains('Login') |
|    | kw Wait Until Element Visible | ${element} |
|    | kw Click Element | ${element} |

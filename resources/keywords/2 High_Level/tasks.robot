| *** Settings *** |
| Resource       | ../4 Utility/main.robot |

| *** Keywords *** |
| kw Verify Tasks Heading |
|    | [Arguments] | ${value} |
|    | Set Test Variable | ${var_DEBUG_KW_HIGHLEVEL} | Tasks Node |
|    | Set Test Variable | ${var_DEBUG_KW_LOWLEVEL} | Verify Task Heading |
|    | kw Log Keyword Status |
|    | kw Wait For Top Frame To Load |
|    | kw Hide StickyHeader |
|    | kw Wait Until Element Visible | jquery=[data-test-id='tasks-title'] |
|    | kw Wait Until Element Contains | jquery=[data-test-id='tasks-title'] | ${value} |

| kw Verify Grid Column Headings |
|    | Set Test Variable | ${var_DEBUG_KW_HIGHLEVEL} | Tasks Node |
|    | Set Test Variable | ${var_DEBUG_KW_LOWLEVEL} | Verify Grid Column Headings |
|    | kw Log Keyword Status |
|    | kw Wait For Top Frame To Load |
|    | kw Hide StickyHeader |
|    | kw Wait Until Element Visible | jquery=h4:contains('Tasks') |
|    | kw Wait Until Element Visible | jquery=div[scroll-target='AppNode4']:contains('Tasks') th[data-title='Task'] |
|    | kw Wait Until Element Contains | jquery=div[scroll-target='AppNode4']:contains('Tasks') th[data-title='Task'] | Task |
|    | kw Wait Until Element Visible | jquery=div[scroll-target='AppNode4']:contains('Tasks') th[data-title='Note'] |
|    | kw Wait Until Element Contains | jquery=div[scroll-target='AppNode4']:contains('Tasks') th[data-title='Note'] | Note |
|    | kw Wait Until Element Visible | jquery=div[scroll-target='AppNode4']:contains('Tasks') th[data-title='Completion Date'] |
|    | kw Wait Until Element Contains | jquery=div[scroll-target='AppNode4']:contains('Tasks') th[data-title='Completion Date'] | Completion Date |
|    | kw Wait Until Element Visible | jquery=div[scroll-target='AppNode4']:contains('Tasks') th[data-title='Scheduled Date'] |
|    | kw Wait Until Element Contains | jquery=div[scroll-target='AppNode4']:contains('Tasks') th[data-title='Scheduled Date'] | Scheduled Date |

| kw Verify Task Name |
|    | [Arguments] | ${value} |
|    | Set Test Variable | ${var_DEBUG_KW_HIGHLEVEL} | Tasks Node |
|    | Set Test Variable | ${var_DEBUG_KW_LOWLEVEL} | Verify Task Name |
|    | kw Log Keyword Status |
|    | kw Wait For Top Frame To Load |
|    | kw Hide StickyHeader |
|    | kw Wait Until Element Visible | jquery=[ng-bind*='description'] |
|    | kw Wait Until Element Contains | jquery=[ng-bind*='description'] | ${value} |

| kw Verify Task Note |
|    | [Arguments] | ${value} |
|    | Set Test Variable | ${var_DEBUG_KW_HIGHLEVEL} | Tasks Node |
|    | Set Test Variable | ${var_DEBUG_KW_LOWLEVEL} | Verify Task Name |
|    | kw Log Keyword Status |
|    | kw Wait For Top Frame To Load |
|    | kw Hide StickyHeader |
|    | kw Wait Until Element Visible | jquery=[ng-bind*='note'] |
|    | kw Wait Until Element Contains | jquery=[ng-bind*='note'] | ${value} |

| kw Verify Task Completion Date |
|    | [Arguments] | ${value} |
|    | Set Test Variable | ${var_DEBUG_KW_HIGHLEVEL} | Tasks Node |
|    | Set Test Variable | ${var_DEBUG_KW_LOWLEVEL} | Verify Task Name |
|    | kw Log Keyword Status |
|    | kw Wait For Top Frame To Load |
|    | kw Hide StickyHeader |
|    | kw Wait Until Element Visible | jquery=div[scroll-target='AppNode4'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=div[scroll-target='AppNode4'] td:contains('${value}') | ${value} |

| kw Verify Task Scheduled Date |
|    | [Arguments] | ${value} |
|    | Set Test Variable | ${var_DEBUG_KW_HIGHLEVEL} | Tasks Node |
|    | Set Test Variable | ${var_DEBUG_KW_LOWLEVEL} | Verify Task Name |
|    | kw Log Keyword Status |
|    | kw Wait For Top Frame To Load |
|    | kw Hide StickyHeader |
|    | kw Wait Until Element Visible | jquery=div[scroll-target='AppNode4'] td:contains('${value}') |
|    | kw Wait Until Element Contains | jquery=div[scroll-target='AppNode4'] td:contains('${value}') | ${value} |
